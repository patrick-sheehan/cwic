//
//  UIAlertController.swift
//  cwic
//
//  Created by Patrick Sheehan on 12/15/16.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

extension UIAlertController {
  
  func addCancelAction() {
    addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
  }
  
  func withAction(_ action: UIAlertAction) -> UIAlertController {
    addAction(action)
    return self
  }
  
  func withCancelAction() -> UIAlertController {
    addCancelAction()
    return self
  }
}

