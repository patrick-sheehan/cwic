//
//  RegisterViewController.swift
//  Conqube
//
//  Created by Patrick Sheehan on 12/11/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Eureka

class RegisterViewController: FormViewController {
  
  var username: String = ""
  var email: String = ""
  var password1: String = ""
  var password2: String = ""
  
  var authDelegate: AuthDelegate? = nil
  
  func performRegistration() {
    var params = ["username": username, "password1": password1, "password2": password2]
    if (!email.isEmpty) {
       params["email"] = email 
    }
    AuthService.register(params) {
      self.authDelegate?.didAuthenticate()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Register"
    
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
      
      <<< EmailRow() {
        $0.title = "Email Address"
        $0.value = self.email
        $0.add(rule: RuleRequired())
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.email = value
          }
        }
      }
      
      <<< PasswordRow() {
        $0.title = "Password"
        $0.value = self.password1
        $0.add(rule: RuleRequired())
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.password1 = value
          }
        }
      }
      
      <<< PasswordRow() {
        $0.title = "Password Confirmation"
        $0.value = self.password2
        $0.add(rule: RuleRequired())
        $0.onChange { [unowned self] row in
          if let value = row.value {
            self.password2 = value
          }
        }
    }
    
    let buttonSection = Section()
      <<< ButtonRow() {
        $0.title = "Register"
        $0.onCellSelection { _, _ in
          self.performRegistration()
        }
      }
      <<< ButtonRow() {
        $0.title = "Login"
        $0.onCellSelection { _, _ in
          self.authDelegate?.goToLogin()
        }
    }
    
    form += [fieldSection, buttonSection]
  }
}
