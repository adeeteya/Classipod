import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  private var libraryDirectory: URL?

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
      guard call.method == "accessDirectory" else {
        result(FlutterMethodNotImplemented)
        return
      }
      guard let self = self,
            let arguments = call.arguments as? [String: Any],
            let path = arguments["directory"] as? String else {
        result(FlutterError(code: "invalid_directory", message: "Missing directory", details: nil))
        return
      }
      do {
        var stale = false
        let url: URL
        if let bookmark = arguments["bookmark"] as? FlutterStandardTypedData {
          url = try URL(resolvingBookmarkData: bookmark.data,
                        options: [.withSecurityScope, .withoutUI],
                        relativeTo: nil, bookmarkDataIsStale: &stale)
        } else {
          url = URL(fileURLWithPath: path, isDirectory: true)
        }
        if self.libraryDirectory != url {
          let accessing = url.startAccessingSecurityScopedResource()
          // Open panels already grant access; app-owned folders need no scope.
          guard accessing || FileManager.default.isReadableFile(atPath: url.path) else {
            throw CocoaError(.fileReadNoPermission)
          }
          self.libraryDirectory?.stopAccessingSecurityScopedResource()
          self.libraryDirectory = accessing ? url : nil
        }
        let bookmark = try url.bookmarkData(
          options: [.withSecurityScope, .securityScopeAllowOnlyReadAccess],
          includingResourceValuesForKeys: nil, relativeTo: nil)
        result(["directory": url.path, "bookmark": FlutterStandardTypedData(bytes: bookmark)])
      } catch {
        result(FlutterError(code: "directory_access", message: error.localizedDescription, details: nil))
      }
    }

    super.awakeFromNib()
  }
}
