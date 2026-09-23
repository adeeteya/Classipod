import Flutter
import UIKit
import UniformTypeIdentifiers

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate,
  UIDocumentPickerDelegate {
  private var libraryDirectory: URL?
  private var directoryPickerResult: FlutterResult?

  deinit {
    libraryDirectory?.stopAccessingSecurityScopedResource()
  }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    guard let registrar = engineBridge.pluginRegistry.registrar(
      forPlugin: "ClassipodLibraryFileAccess") else { return }
    let channel = FlutterMethodChannel(
      name: "classipod/library_file_access", binaryMessenger: registrar.messenger())
    channel.setMethodCallHandler { [weak self] call, result in
      guard let self = self else { return }
      switch call.method {
      case "pickDirectory":
        guard self.directoryPickerResult == nil else {
          result(FlutterError(code: "picker_active",
                              message: "A folder picker is already open", details: nil))
          return
        }
        guard let presenter = registrar.viewController,
              presenter.viewIfLoaded?.window != nil,
              presenter.presentedViewController == nil else {
          result(FlutterError(code: "picker_unavailable",
                              message: "Cannot present the music folder picker", details: nil))
          return
        }
        let picker = UIDocumentPickerViewController(
          forOpeningContentTypes: [.folder], asCopy: false)
        picker.delegate = self
        picker.allowsMultipleSelection = false
        self.directoryPickerResult = result
        presenter.present(picker, animated: true)
      case "accessDirectory":
        do {
          guard let arguments = call.arguments as? [String: Any],
                let bookmark = arguments["bookmark"] as? FlutterStandardTypedData else {
            throw CocoaError(.fileReadNoPermission)
          }
          var stale = false
          // iOS bookmarks use empty options, unlike macOS .withSecurityScope.
          let url = try URL(resolvingBookmarkData: bookmark.data, options: [],
                            relativeTo: nil, bookmarkDataIsStale: &stale)
          result(try self.authorizeDirectory(url))
        } catch {
          result(self.directoryError(error))
        }
      default:
        result(FlutterMethodNotImplemented)
      }
    }
  }

  func documentPicker(_ controller: UIDocumentPickerViewController,
                      didPickDocumentsAt urls: [URL]) {
    let result = directoryPickerResult
    directoryPickerResult = nil
    guard let url = urls.first else {
      result?(nil)
      return
    }
    do {
      // Preserve the actual picker URL while its security scope is available.
      result?(try authorizeDirectory(url))
    } catch {
      result?(directoryError(error))
    }
  }

  func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
    let result = directoryPickerResult
    directoryPickerResult = nil
    result?(nil)
  }

  private func authorizeDirectory(_ url: URL) throws -> [String: Any] {
    let alreadyAccessing = libraryDirectory == url
    let started = !alreadyAccessing && url.startAccessingSecurityScopedResource()
    do {
      guard alreadyAccessing || started else {
        throw CocoaError(.fileReadNoPermission)
      }
      let values = try url.resourceValues(forKeys: [.isDirectoryKey])
      guard values.isDirectory == true else { throw CocoaError(.fileReadUnknown) }
      // Recreating the bookmark also refreshes stale bookmarks after resolution.
      let bookmark = try url.bookmarkData(options: [],
        includingResourceValuesForKeys: nil, relativeTo: nil)
      if !alreadyAccessing {
        libraryDirectory?.stopAccessingSecurityScopedResource()
        libraryDirectory = url
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
