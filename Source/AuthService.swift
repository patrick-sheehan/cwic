//
//  AuthService.swift
//  CWIC
//
//  Created by Patrick Sheehan on 12/11/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class AuthService {
  
  static let URL_STR_LOGIN = "\(ApiService.BaseURL)/auth/login/"
  static let URL_STR_REGISTER = "\(ApiService.BaseURL)/auth/register/"
  
  class var authKey: String? {
    get { return UserDefaults.standard.string(forKey: "auth_key") }
    set { UserDefaults.standard.set(newValue, forKey: "auth_key") }
  }
  
  class var csrftoken: String? {
    get { return UserDefaults.standard.string(forKey: "csrftoken") }
    set { UserDefaults.standard.set(newValue, forKey: "csrftoken") }
  }
  
  class var shouldPromptProfileUpdate: Bool {
    get { return UserDefaults.standard.bool(forKey: "shouldPromptProfileUpdate") }
    set { UserDefaults.standard.set(newValue, forKey: "shouldPromptProfileUpdate") }
  }
  
  class func hasSavedCredentials() -> Bool {
    return authKey != nil && csrftoken != nil
  }
  
  class func deleteCredentials() {
    self.authKey = nil
    self.csrftoken = nil
    
  }
  
  class func login(_ params: [String: Any], completion: @escaping () -> Void) {
    ApiService.authRequest(urlString: URL_STR_LOGIN, params: params, completion)
  }
  
  class func register(_ params: [String: Any], completion: @escaping () -> Void) {
    ApiService.authRequest(urlString: URL_STR_REGISTER, params: params, completion)
  }
  
  class func logout() {
    deleteCredentials()
    ApiService.clearCookies()
  }
}
  /*
  class var authKey: String? {
    get {
      return UserDefaults.standard.string(forKey: "auth_key")
    } set {
      UserDefaults.standard.set(newValue, forKey: "auth_key")
    }
  }
  
  class var csrftoken: String? {
    get {
      return UserDefaults.standard.string(forKey: "csrftoken")
    } set {
      UserDefaults.standard.set(newValue, forKey: "csrftoken")
    }
  }
  
  
  class func didAuthenticate(json: [String: Any], _ completion: () -> Void) {
    if let key = json["key"] as? String {
      print("did authenticate with key: \(key)")
      authKey = key
      completion()
    }
  }
  
  class func login(_ username: String,
                   _ password: String,
                   completion: @escaping () -> Void) {
    let params = ["username": username, "password": password]
    API.loginRequest(params, completion)
  }
  
  class func register(_ username: String,
                      email: String,
                      password1: String,
                      password2: String,
                      completion: @escaping () -> Void) {
    
    let url = "\(API.BaseURL)/auth/register/"
    let params = ["username": username, "email": email, "password1": password1, "password2": password2]
    API.request("POST", url, params) {
      self.didAuthenticate(json: $0, completion)
    }
  }
  
  class func logout(completion: @escaping () -> Void) {
    let url = "\(API.BaseURL)/auth/logout/"
    API.request("POST", url, nil) { _ in
      self.authKey = nil
      completion()
    }
  }
}

*/
