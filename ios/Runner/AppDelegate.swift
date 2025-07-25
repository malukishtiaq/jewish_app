import Flutter
import UIKit
import ffmpeg_kit_flutter_local

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    guard let window = window,
          let controller = window.rootViewController as? FlutterViewController else {
      return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    // Register FFmpeg plugin
    FFmpegKitFlutterPlugin.register(with: self.registrar(forPlugin: "FFmpegKitFlutterPlugin")!)
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
