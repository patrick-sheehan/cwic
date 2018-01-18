//
//  UINavigationController.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

extension UINavigationController {
    
  convenience init(_ title: String, _ image: UIImage, _ root: UIViewController) {
    self.init(rootViewController: root)
    tabBarItem = UITabBarItem(title: title, image: image, selectedImage: image)
  }
}
