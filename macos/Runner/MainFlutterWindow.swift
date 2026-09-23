import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private var libraryDirectory: URL?
  private var directoryPickerActive = false

  deinit {
    libraryDirectory?.stopAccessingSecurityScopedResource()
  }

  override func awakeFromNib() {
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    let libraryAccess = FlutterMethodChannel(
      name: "classipod/library_file_access",
      binaryMessenger: flutterViewController.engine.binaryMessenger)
    libraryAccess.setMethodCallHandler { [weak self] call, result in
      guard let self = self else { return }
      switch call.method {
      case "pickDirectory":
        self.pickDirectory(result: result)
      case "accessDirectory":
        do {
          guard let arguments = call.arguments as? [String: Any],
                let path = arguments["directory"] as? String else {
            throw CocoaError(.fileReadInvalidFileName)
          }
          var stale = false
          let url: URL
          if let bookmark = arguments["bookmark"] as? FlutterStandardTypedData {
            url = try URL(resolvingBookmarkData: bookmark.data,
                          options: [.withSecurityScope, .withoutUI],
                          relativeTo: nil, bookmarkDataIsStale: &stale)
          } else {
            url = URL(fileURLWithPath: path, isDirectory: true)
          }
          result(try self.authorizeDirectory(url))
        } catch {
          result(self.directoryError(error))
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    super.awakeFromNib()
  }

  private func pickDirectory(result: @escaping FlutterResult) {
    guard !directoryPickerActive else {
      result(FlutterError(code: "picker_active",
                          message: "A folder picker is already open", details: nil))
      return
    }
    let panel = NSOpenPanel()
    panel.title = "Select Music Directory"
    panel.message = "Select a parent folder containing your music."
    panel.canChooseDirectories = true
    panel.canChooseFiles = false
    panel.allowsMultipleSelection = false
    panel.directoryURL = libraryDirectory
      ?? FileManager.default.urls(for: .musicDirectory, in: .userDomainMask).first
    directoryPickerActive = true
    panel.beginSheetModal(for: self) { [weak self] response in
      guard let self = self else { return }
      self.directoryPickerActive = false
      guard response == .OK, let url = panel.url else {
        result(nil)
        return
      }
      do {
        result(try self.authorizeDirectory(url))
      } catch {
        result(self.directoryError(error))
      }
    }
  }

  private func authorizeDirectory(_ url: URL) throws -> [String: Any] {
    let alreadyAccessing = libraryDirectory == url
    let started = !alreadyAccessing && url.startAccessingSecurityScopedResource()
    do {
      // App-owned directories need no scope; the open panel also grants access.
      guard alreadyAccessing || started ||
              FileManager.default.isReadableFile(atPath: url.path) else {
        throw CocoaError(.fileReadNoPermission)
      }
      let values = try url.resourceValues(forKeys: [.isDirectoryKey])
      guard values.isDirectory == true else { throw CocoaError(.fileReadUnknown) }
      let bookmark = try url.bookmarkData(
        options: [.withSecurityScope, .securityScopeAllowOnlyReadAccess],
        includingResourceValuesForKeys: nil, relativeTo: nil)
      if !alreadyAccessing {
        libraryDirectory?.stopAccessingSecurityScopedResource()
        libraryDirectory = started ? url : nil
      }
      // Keep the scope open for tag extraction AND later audio playback.
      return ["directory": url.path,
              "bookmark": FlutterStandardTypedData(bytes: bookmark)]
    } catch {
      if started { url.stopAccessingSecurityScopedResource() }
      throw error
    }
  }

  private func directoryError(_ error: Error) -> FlutterError {
    FlutterError(code: "directory_access",
                 message: error.localizedDescription, details: nil)
  }
}
