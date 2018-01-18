//
//  UserService.swift
//  Conqube
//
//  Created by Patrick Sheehan on 12/11/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class UserService {
  
  static let USERS_URL = "\(ApiService.BaseURL)/users/"
  static let COMMITTEE_MEMBERS_URL = "\(ApiService.BaseURL)/users/"
  
  class var myUserId: Int? {
    get {
      return UserDefaults.standard.value(forKey: "myUserId") as? Int
    } set {
      UserDefaults.standard.set(newValue, forKey: "myUserId")
    }
  }
  
  class func list(_ url: String, _ completion: @escaping ([User]) -> Void) {
    ApiService.request("GET", url, nil) { json in
      guard let results = json["results"] as? [[String: Any]] else {
        PrinterService.error("Failed to get User list"); return
      }
      completion(results.map { User(json: $0) })
    }
  }
  
  class func listCommitteeMembers(_ completion: @escaping ([User]) -> Void) {
    ApiService.request("GET", COMMITTEE_MEMBERS_URL, nil) { json in
      guard let results = json["results"] as? [[String: Any]] else {
        PrinterService.error("Failed to get User list"); return
      }
      completion(results.map { User(json: $0) })
    }
  }
  
  class func getMyProfile(_ completion: @escaping (User) -> Void) {
    let url = "\(ApiService.BaseURL)/users/mine/"
    ApiService.request("GET", url, nil) { json in
      guard let id = json["id"] as? Int else {
        PrinterService.error("Failed to get my user id"); return
      }
      self.myUserId = id
      let profileUrl = "\(ApiService.BaseURL)/users/\(id)"
      ApiService.request("GET", profileUrl, nil) {
        completion(User(json: $0))
      }
    }
  }
  
  class func patchProfile(_ params: [String: Any], _ completion: @escaping () -> Void) {
    guard let myUserId = myUserId else {
      return
    }
    let url = "\(ApiService.BaseURL)/users/\(myUserId)/"
    ApiService.request("PATCH", url, params) { json in
      PrinterService.log("Result of patchProfile: \(json)")
      completion()
    }
  }
}
