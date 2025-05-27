//
//  AppDelegate.swift
//  GlobeJSONFeed
//
//  Created by Adonis Dumadapat on 5/25/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?

  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    App.shared.bootstrap()

    let sb = UIStoryboard(name: "Home", bundle: Bundle.main)
    let vc = sb.instantiateViewController(withIdentifier: "HomeController")

    if let vc = vc as? HomeController {
      vc.viewModel = HomeViewModel()
    }

    let nc = UINavigationController(rootViewController: vc)

    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = nc
    self.window = window

    window.makeKeyAndVisible()

    return true
  }
}
