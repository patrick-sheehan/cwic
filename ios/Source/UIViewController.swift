//
//  UIViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 10/7/16.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit
import MBProgressHUD
import Toaster

extension UIViewController {

  func dismiss() {
    let _ = navigationController?.popViewController(animated: true)
  }
  
  func showPopupError(_ message: String) {
    Toast(text: message).show()
  }
  
  func showPopupSuccess(_ message: String) {
    
    Toast(text: message).show()
  }
  
  func showPopupInfo(_ message: String) {
    
    present(
      UIAlertController(title: message, message: nil, preferredStyle: .alert)
        .withAction(UIAlertAction(title: "Dismiss", style: .default, handler: nil)),
      animated: true, completion: nil)
  }
  
  func showLoadingView() {
    
    let loadingView = MBProgressHUD(view: view)
    
    view.addSubview(loadingView)
    
    loadingView.label.textColor = .white
    loadingView.show(animated: true)
  }
  
  func hideLoadingView() {
    MBProgressHUD.hide(for: view, animated: true)
  }
}
