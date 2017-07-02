//
//  UINavigationController.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

extension UINavigationController {
  
  static func getRootView() -> UIViewController {
    
    let tabBar = UITabBarController()
    tabBar.viewControllers = [
      UINavigationController("Profile", .Profile, UIStoryboard.getViewController(.Profile)),
      UINavigationController("Events", .Events, EventListViewController()),
      UINavigationController("About", .About, UIStoryboard.getViewController(.Event)),
      UINavigationController("Sponsors", .Sponsors, SponsorListViewController())
    ]
    return tabBar
    
  }
  
  convenience init(_ title: String, _ image: UIImage?, _ root: UIViewController) {
    
    self.init(rootViewController: root)
    
    tabBarItem = UITabBarItem(title: title,
                              image: image?.withRenderingMode(.alwaysOriginal),
                              selectedImage: image)
  }
}
