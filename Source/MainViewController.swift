//
//  MainViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/13/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import SJSegmentedScrollView

@objc protocol AuthDelegate {
  func didAuthenticate()
  func goToRegister()
  func didRegister()
  @objc func goToLogin()
}

class MainViewController: UITabBarController {
  
  // MARK: - Member Variables
  var application: UIApplication? = nil
  let loginVC = LoginViewController()
  let registerVC = RegisterViewController()
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loginVC.authDelegate = self
    registerVC.authDelegate = self
    
    viewControllers = [
      UINavigationController("About", TabImages.About, AboutCwicViewController.generate()),
      UINavigationController("Events", TabImages.Events, EventListViewController()),
      UINavigationController("Sponsors", TabImages.Sponsors, SponsorListViewController()),
      UINavigationController("Profile", TabImages.Profile, ProfileViewController.generate(delegate: self)),
    ]
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if AuthService.hasSavedCredentials() {
      PrinterService.log("MainViewController appeared and found credentials saved")
      PrinterService.log("initialize Notification Service")
      
      // Initialize notifications
//      if let application = application {
//        NotificationService.initialize(application)
//      }
      
    } else {
      PrinterService.log("Missing credentials, go to login view")
      self.goToLogin()
    }
  }
}


// MARK: - Auth Delegate Methods
extension MainViewController: AuthDelegate {
  
  @objc func goToLogin() {
    if let presentedVC = self.presentedViewController {
      if presentedVC.presentedViewController == registerVC {
        registerVC.dismiss(animated: true, completion: nil)
      }
      return
    }
    
    AuthService.logout()
    present(loginVC, animated: true, completion: nil)
  }
  
  func goToRegister() {
    if let presentedVC = self.presentedViewController {
      if presentedVC == loginVC {
        loginVC.present(registerVC, animated: true, completion: nil)
      }
    }
  }
  
  func didAuthenticate() {
    presentedViewController?.dismiss(animated: true, completion: nil) // TODO: Can this be removed?
    registerVC.dismiss(animated: true, completion: nil)
    loginVC.dismiss(animated: true, completion: nil)
  }
  
  func didRegister() {
    // Finished registration, now show ProfileForm once we have the User
    // But, we must have the current User's data before prompting
    AuthService.shouldPromptProfileUpdate = true
    didAuthenticate()
  }
}
