#!/usr/bin/env python3
"""Generate and test disposable music libraries. Requires Python 3.10+, FFmpeg,
and the repository's Flutter SDK/dependencies. No third-party Python packages.
"""

import argparse
import hashlib
import json
import os
from pathlib import Path
import platform
import shutil
import signal
import struct
import subprocess
import sys
import tempfile
import time
import zlib


REPO = Path(__file__).resolve().parents[1]


def write_json(path, value):
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding="utf-8")


def execute(command, log, timeout, env=None):
    """Kill the complete worker tree on timeout, not just the Flutter launcher."""
    options = {"start_new_session": True} if os.name != "nt" else {
        "creationflags": subprocess.CREATE_NEW_PROCESS_GROUP
    }
    with log.open("w", encoding="utf-8") as output:
        process = subprocess.Popen(
            command, cwd=REPO, env=env, stdout=output,
            stderr=subprocess.STDOUT, **options,
        )
        try:
            code = process.wait(timeout=timeout)
        except (subprocess.TimeoutExpired, KeyboardInterrupt):
            if os.name == "nt":
                subprocess.run(
                    ["taskkill", "/PID", str(process.pid), "/T", "/F"],
                    check=False, capture_output=True,
                )
            else:
                os.killpg(process.pid, signal.SIGKILL)
            process.wait()
            raise
    if code:
        raise RuntimeError(f"Exit {code}: {command[0]}; see {log}")


def png_bytes(red, green, blue):
    """Create original deterministic 8x8 RGB artwork without image dependencies."""
    def chunk(kind, payload):
        return (struct.pack(">I", len(payload)) + kind + payload
                + struct.pack(">I", zlib.crc32(kind + payload)))

    pixels = (b"\x00" + bytes([red, green, blue]) * 8) * 8
    return (b"\x89PNG\r\n\x1a\n"
            + chunk(b"IHDR", struct.pack(">IIBBBBB", 8, 8, 8, 2, 0, 0, 0))
            + chunk(b"IDAT", zlib.compress(pixels)) + chunk(b"IEND", b""))


def generate(root, count, timeout):
    started = time.perf_counter()
    templates = root / "templates"
    templates.mkdir()
    specs = []
    for album in range(100):
        art = templates / f"art-{album:03}.png"
        art.write_bytes(png_bytes(album * 2, 80, 200))
        for format_index, extension in enumerate(("mp3", "flac", "wav")):
            index = album * 3 + format_index
            optional = album % 5 != 0
            artwork = album % 2 == 0 and extension != "wav"
            title = f"Track {index:03}" + (" café 東京" if extension != "wav" else "")
            artist = f"Artist {album % 20:02}"
            album_name = f"Album {album:03}"
            target = templates / f"template-{index:03}.{extension}"
            command = ["ffmpeg", "-hide_banner", "-loglevel", "error", "-nostdin",
                       "-f", "lavfi", "-i", "sine=frequency=440:duration=1:sample_rate=44100"]
            if artwork:
                command += ["-i", str(art), "-map", "0:a", "-map", "1:v",
                            "-c:v", "copy", "-disposition:v", "attached_pic"]
            command += ["-c:a", {"mp3": "libmp3lame", "flac": "flac",
                                  "wav": "pcm_s16le"}[extension]]
            if extension == "mp3":
                command += ["-b:a", "128k", "-id3v2_version", "3"]
            command += ["-metadata", f"title={title}", "-metadata", f"artist={artist}",
                        "-metadata", f"album={album_name}"]
            if optional:
                command += ["-metadata", "track=1", "-metadata", "date=2020-01-01",
                            "-metadata", "genre=Electronic"]
            command += [str(target)]
            execute(command, root / "generation.log", timeout)
            if extension == "wav" and optional:
                # FFmpeg emits IPRT; the current metadata dependency reads ITRK.
                # Use its supported RIFF track-number spelling for this scale
                # corpus, without deriving expectations from parsed output.
                data = target.read_bytes()
                old = b"IPRT\x02\x00\x00\x001\x00"
                if data.count(old) != 1:
                    raise RuntimeError("Unexpected FFmpeg WAV track chunk")
                target.write_bytes(data.replace(old, b"ITRK\x02\x00\x00\x001\x00", 1))
            specs.append({
                "template": target,
                "expected": {
                    "trackName": title, "trackArtistNames": [artist],
                    "albumName": album_name, "albumArtistName": artist,
                    "trackNumber": 1 if optional else None,
                    # The MP3 reader's documented source-level fallback is
                    # DateTime(0), unlike FLAC/WAV's nullable missing year.
                    "year": 2020 if optional else (0 if extension == "mp3" else None),
                    "genres": ["Electronic"] if optional else [],
                    "albumLength": None, "discNumber": None, "lyrics": None,
                    "mimeType": "image/png" if artwork else None,
                    "isOnDevice": True, "rating": 0,
                },
                "durationMs": 1000,
                "durationToleranceMs": 100 if extension == "mp3" else 1,
                "artwork": art.relative_to(root).as_posix() if artwork else None,
            })
        if album % 20 == 19:
            print(f"Generated {(album + 1) * 3}/300 templates", flush=True)

    profiles = {}
    for profile in ("clean", "mixed"):
        music = root / profile / "music"
        music.mkdir(parents=True)
        entries = []
        size = 0
        for number in range(count):
            spec = specs[number % len(specs)]
            source = spec["template"]
            extension = source.suffix.upper() if number % 7 == 0 else source.suffix
            relative = (f"Artist {number % 20:02}/Album {number % 100:03}/"
                        f"nested café 東京/track-{number:06}{extension}")
            target = music / relative
            target.parent.mkdir(parents=True, exist_ok=True)
            shutil.copyfile(source, target)
            size += target.stat().st_size
            entries.append({k: v for k, v in spec.items() if k != "template"}
                           | {"path": relative, "outcome": "import", "exists": True})
        if profile == "mixed":
            bad = {"empty.mp3": b"", "truncated.mp3": b"ID3\x03",
                   "truncated.flac": b"fLa", "unsupported.txt": b"not audio"}
            for name, data in bad.items():
                (music / name).write_bytes(data)
                size += len(data)
                entries.append({"path": name, "outcome": "skip", "exists": True})
            entries.append({"path": "missing.mp3", "outcome": "skip", "exists": False})
        manifest = root / profile / "manifest.json"
        write_json(manifest, {"schemaVersion": 1, "profile": profile,
                              "validTracks": count, "entries": entries})
        profiles[profile] = {"manifest": str(manifest), "inputBytes": size,
                             "candidateCount": len(entries)}
    return {"durationMs": round((time.perf_counter() - started) * 1000),
            "templateCount": 300, "profiles": profiles}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--tracks", type=int, choices=(1000, 10000, 50000), default=1000)
    parser.add_argument("--timeout-seconds", type=int, default=1800)
    parser.add_argument("--report-dir", type=Path, default=REPO / "build/large-library")
    parser.add_argument("--keep", action="store_true", help="Retain disposable inputs for debugging")
    args = parser.parse_args()
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    args.report_dir.mkdir(parents=True, exist_ok=True)
    # Both output directories are newly created, never reused or recursively
    # removed based on an arbitrary user-supplied path.
    report_dir = Path(tempfile.mkdtemp(prefix=f"run-{args.tracks}-", dir=args.report_dir.resolve()))
    root = Path(tempfile.mkdtemp(prefix="classipod-large-library-")).resolve()
    report = {"schemaVersion": 1, "status": "running", "tracks": args.tracks,
              "platform": platform.platform(), "python": sys.version,
              "machine": platform.machine(), "host": platform.node(),
              "logicalCpus": os.cpu_count(),
              "workspace": str(root), "cases": [], "timeoutSeconds": args.timeout_seconds,
              "memoryScope": "peak RSS of whole Flutter test worker, including isolates and Hive; excludes launcher/compiler"}
    print(f"Report: {report_dir}\nDisposable library: {root}", flush=True)
    try:
        for name, command in (("flutter", ["flutter", "--version"]),
                              ("ffmpeg", ["ffmpeg", "-version"]),
                              ("revision", ["git", "rev-parse", "HEAD"])):
            executable = shutil.which(command[0])
            if not executable:
                raise RuntimeError(f"Missing executable: {command[0]}")
            command[0] = executable
            execute(command, report_dir / f"{name}.txt", args.timeout_seconds)
            report[name] = (report_dir / f"{name}.txt").read_text(encoding="utf-8").strip()
        report["generation"] = generate(root, args.tracks, args.timeout_seconds)
        flutter = shutil.which("flutter")
        import_digests = {}

        def worker(name, config):
            case = {"name": name, "status": "running"}
            report["cases"].append(case)
            config_path = root / f"{name}.json"
            result_path = report_dir / f"{name}.json"
            write_json(config_path, config | {"result": str(result_path), "root": str(root)})
            env = os.environ | {"CLASSIPOD_LARGE_LIBRARY_CONFIG": str(config_path)}
            print(f"Running {name}", flush=True)
            try:
                execute([flutter, "test", "--no-pub", "--suppress-analytics",
                         "--concurrency=1", "--timeout=none", "--reporter=expanded",
                         "tool/large_library/worker_test.dart"],
                        report_dir / f"{name}.log", args.timeout_seconds, env)
                case.update(json.loads(result_path.read_text(encoding="utf-8")))
                if config["mode"] == "import":
                    snapshot = json.loads((Path(config["output"]) / "snapshot.json")
                                          .read_text(encoding="utf-8"))
                    for record in snapshot:
                        # Original indices reflect filesystem traversal order.
                        record.pop("originalSongIndex")
                        if record["thumbnailPath"]:
                            record["thumbnailPath"] = Path(record["thumbnailPath"]).name
                    snapshot.sort(key=lambda record: record["filePath"])
                    digest = hashlib.sha256(json.dumps(snapshot, sort_keys=True)
                                            .encode("utf-8")).hexdigest()
                    previous = import_digests.setdefault(config["profile"], digest)
                    if previous != digest:
                        raise RuntimeError("Import results changed across methods/repeats")
                    case["normalizedImportSha256"] = digest
                case["status"] = "passed"
            except BaseException as error:
                case.update(status="failed", error=str(error))
                raise
            finally:
                write_json(report_dir / "report.json", report)

        worker("synthetic", {"mode": "synthetic", "count": args.tracks})
        for profile, data in report["generation"]["profiles"].items():
            for method in ("directory", "files"):
                for repeat in (1, 2):
                    name = f"{profile}-{method}-{repeat}"
                    output = root / name
                    output.mkdir()
                    config = {"manifest": data["manifest"], "output": str(output),
                              "method": method, "profile": profile}
                    worker(name, config | {"mode": "import"})
                    worker(f"{name}-reopen", config | {"mode": "reopen"})
        report["status"] = "passed"
    except BaseException as error:
        report.update(status="failed", error=f"{type(error).__name__}: {error}")
        print(report["error"], file=sys.stderr)
    finally:
        if (root / "generation.log").exists():
            shutil.copyfile(root / "generation.log", report_dir / "generation.log")
        write_json(report_dir / "report.json", report)
        if not args.keep:
            shutil.rmtree(root)
        print(f"{report['status']}: {report_dir / 'report.json'}", flush=True)
    return 0 if report["status"] == "passed" else 1


if __name__ == "__main__":
    sys.exit(main())
