//
//  AppDelegate.swift
//  CWIC
//
//  Created by Patrick Sheehan on 4/26/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit


enum Colors {
  static let Red = UIColor(netHex: 0xCE171F)
  static let Black = UIColor(netHex: 0x040707)
  static let RoyalBlue = UIColor(netHex: 0x1F11A5)
}

enum Fonts {
  static let Lucida = UIFont(name: "LucidaGrande", size: 16.0)!
}


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    /// Configure navigation bar
    let navigationBarAppearance = UINavigationBar.appearance()
    navigationBarAppearance.tintColor = .white
    navigationBarAppearance.barTintColor = Colors.Red
    navigationBarAppearance.isTranslucent = false
    navigationBarAppearance.titleTextAttributes = [
      NSForegroundColorAttributeName: UIColor.white,
      NSFontAttributeName: Fonts.Lucida
    ]
    
    /// Configure tab bar
    let tabBarAppearance = UITabBar.appearance()
    tabBarAppearance.tintColor = .white
    tabBarAppearance.barTintColor = Colors.RoyalBlue
    
    
    /// Build Event VCs
    let allEventsVC = EventListViewController(title: "Events", uri: API.getEventsUriHelper(), showFilterButton: true)
    let trendingEventsVC = EventListViewController(title: "Trending", uri: API.getEventsUriHelper(filter: .trending))
    let starredEventsVC = EventListViewController(title: "Starred", uri: API.getEventsUriHelper(filter: .starred))
    
    /// Configure main window
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = UITabBarController([
      UINavigationController("Events", .Events, allEventsVC),
      UINavigationController("Trending", .Events, trendingEventsVC),
      UINavigationController("Starred", .Events, starredEventsVC),
      UINavigationController("Sponsors", .Sponsors, SponsorListViewController()),
      UINavigationController("Profile", .Profile, UIStoryboard.getViewController(.Profile)),
    ])
    window?.makeKeyAndVisible()
    
    return true
  }
  
}

