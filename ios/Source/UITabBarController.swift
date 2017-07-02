//
//  UITabBarController.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

extension UITabBarController {
  
  convenience init(_ viewControllers: [UIViewController]) {
    self.init()
    self.viewControllers = viewControllers
  }
}
