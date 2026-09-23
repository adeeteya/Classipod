"""Regression checks for the external-process watchdog, without Flutter/FFmpeg."""

import json
import os
from pathlib import Path
import subprocess
import sys
import tempfile
import time
import unittest

from large_library import REPO, execute


class WatchdogTests(unittest.TestCase):
    def test_failed_run_preserves_reports_and_removes_only_owned_workspace(self):
        with tempfile.TemporaryDirectory() as directory:
            reports = Path(directory) / "reports"
            reports.mkdir()
            sentinel = reports / "existing-report.txt"
            sentinel.write_text("keep this")
            result = subprocess.run(
                [sys.executable, str(REPO / "scripts/large_library.py"),
                 "--report-dir", str(reports)],
                env=os.environ | {"PATH": ""}, capture_output=True,
                text=True, check=False, timeout=10,
            )
            self.assertEqual(result.returncode, 1, result.stderr)
            report_paths = list(reports.glob("run-*/report.json"))
            self.assertEqual(len(report_paths), 1)
            report = json.loads(report_paths[0].read_text())
            self.assertEqual(report["status"], "failed")
            self.assertIn("Missing executable: flutter", report["error"])
            self.assertFalse(Path(report["workspace"]).exists())
            self.assertEqual(sentinel.read_text(), "keep this")

    def test_nonzero_exit_preserves_failure_details(self):
        with tempfile.TemporaryDirectory() as directory:
            log = Path(directory) / "failure.log"
            with self.assertRaisesRegex(RuntimeError, "Exit 7"):
                execute([sys.executable, "-c",
                         "print('failure detail', flush=True); raise SystemExit(7)"],
                        log, timeout=10)
            self.assertIn("failure detail", log.read_text())

    @unittest.skipIf(os.name == "nt", "POSIX process-group assertion")
    def test_timeout_kills_descendants_and_preserves_log(self):
        with tempfile.TemporaryDirectory() as directory:
            log = Path(directory) / "timeout.log"
            program = (
                "import subprocess, sys, time; "
                "child = subprocess.Popen([sys.executable, '-c', 'import time; time.sleep(60)']); "
                "print(child.pid, flush=True); time.sleep(60)"
            )
            start = time.monotonic()
            with self.assertRaises(subprocess.TimeoutExpired):
                execute([sys.executable, "-c", program], log, timeout=2)
            self.assertLess(time.monotonic() - start, 10)
            child_pid = log.read_text().strip()
            self.assertTrue(child_pid.isdigit())
            # A terminated child may briefly remain a zombie until init reaps
            # it; neither a zombie nor an absent PID is a running descendant.
            state = subprocess.run(
                ["ps", "-o", "stat=", "-p", child_pid],
                capture_output=True, text=True, check=False,
            ).stdout.strip()
            self.assertTrue(not state or state.startswith("Z"), state)


if __name__ == "__main__":
    unittest.main()
