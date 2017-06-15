//
//  RootViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class RootViewController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    self.viewControllers = [
      EventActivityListViewController(),
      ProfileViewController(),
      RecipeTableViewController(),
      SponsorTableViewController(),
      AboutViewController()
    ]
    
  }
  
}
