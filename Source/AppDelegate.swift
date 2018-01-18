//
//  AppDelegate.swift
//  CWIC
//
//  Created by Patrick Sheehan on 4/26/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  let mainViewController = MainViewController()
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    /// Configure navigation bar
    let navigationBarAppearance = UINavigationBar.appearance()
    navigationBarAppearance.tintColor = Cwic.Blue
    navigationBarAppearance.barTintColor = Cwic.Red
    navigationBarAppearance.isTranslucent = false
    navigationBarAppearance.titleTextAttributes = [
      NSAttributedStringKey.foregroundColor: Cwic.Red, //UIColor.white,
      NSAttributedStringKey.font: Cwic.Font
    ]
    
    /// Configure tab bar
    let tabBarAppearance = UITabBar.appearance()
    tabBarAppearance.tintColor = .white
    tabBarAppearance.barTintColor = Cwic.Blue
    
    
    ApiService.authDelegate = mainViewController
    
    // Load the main tab view controller
    mainViewController.application = application
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = mainViewController
    window?.makeKeyAndVisible()
    
    return true
  }
}

