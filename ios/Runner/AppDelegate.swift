import UIKit
import Flutter
import BugFinderLibrary
import Kingfisher

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

      BugFinderManager.setup(withConfig: BugFinderConfigManager(projectName: "oneframemobile", enviroment: .prod))

      GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
