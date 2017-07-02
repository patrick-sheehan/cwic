//
//  Action.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class Action: CustomStringConvertible {
  var name: String
  var viewController: UIViewController
  
  var description: String {
    return name.description
  }
  
  init(_ name: String, viewController: UIViewController) {
    self.name = name
    self.viewController = viewController
  }
  
  func didSelect() {
    viewController.showPopupInfo("'\(name)' coming soon!")
  }
  
}
