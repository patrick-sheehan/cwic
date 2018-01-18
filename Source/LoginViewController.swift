//
//  LoginViewController.swift
//  Conqube
//
//  Created by Patrick Sheehan on 12/11/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit
import Eureka

class LoginViewController: FormViewController {
  
  var username: String = "admin"
  var password: String = "jkluio789"
  var authDelegate: AuthDelegate? = nil
  
  func performLogin() {
    let params = ["username": username, "password": password]
    AuthService.login(params) {
      self.authDelegate?.didAuthenticate()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Login"
    
    let fieldSection = Section()
      <<< TextRow() {
        $0.title = "Username"
        $0.value = self.username
        $0.add(rule: RuleRequired())
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.username = value
          }
        }
      }
      
      <<< PasswordRow() {
        $0.title = "Password"
        $0.value = self.password
        $0.add(rule: RuleRequired())
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.password = value
          }
        }
    }
    
    let buttonSection = Section()
      <<< ButtonRow() {
        $0.title = "Login"
        $0.onCellSelection { _, _ in
          self.performLogin()
        }
      }
      <<< ButtonRow() {
        $0.title = "Create an account"
        $0.onCellSelection { _, _ in
          self.authDelegate?.goToRegister()
        }
    }
    
    form += [fieldSection, buttonSection]
  }
}
