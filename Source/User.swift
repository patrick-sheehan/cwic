//
//  User.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class Profile {
  
  var avatar: String
  var birthdate: String
  var gender: String
  var hometown: String
  var how_discovered: String
  var phone_number: String
  var user_type: String
  var years_attended: Int
  
  init(json: [String: Any]) {
    self.avatar = json["avatar"] as? String ?? ""
    self.hometown = json["hometown"] as? String ?? ""
    self.years_attended = json["years_attended"] as? Int ?? 0
    self.how_discovered = json["how_discovered"] as? String ?? ""
    self.phone_number = json["phone_number"] as? String ?? ""
    self.birthdate = json["birthdate"] as? String ?? ""
    self.gender = json["gender_name"] as? String ?? ""
    self.user_type = json["user_type_name"] as? String ?? ""
  }
}

class User {
  
  var id: Int
  var username: String
  var first_name: String
  var last_name: String
  var profile: Profile
  
  
//  var avatar: String
//  var birthdate: String
//  var gender: String
//  var hometown: String
//  var how_discovered: String
//  var phone_number: String
//  var user_type: String
//  var years_attended: Int
  
  var trophies: [Trophy]
  
  init(json: [String: Any]) {
    self.id = json["id"] as? Int ?? 0
    self.username = json["username"] as? String ?? ""
    self.first_name = json["first_name"] as? String ?? ""
    self.last_name = json["last_name"] as? String ?? ""
    
    if let profileJson = json["profile"] as? [String: Any] {
      self.profile = Profile(json: profileJson)
    } else {
      self.profile = Profile(json: [String: Any]())
    }
    
    if let trophiesJson = json["trophies"] as? [[String: Any]] {
      self.trophies = trophiesJson.map { Trophy(json: $0) }
    } else {
      self.trophies = []
    }
  }
}


let UserTypes: [String: String] = [
  "Artist": "A",
  "Committee Member": "C",
  "Judge": "J",
  "Team Leader": "L",
  "Team Member": "M",
  "Sponsor": "S",
  "Visitor": "V",
]

let Genders: [String: String] = [
  "Male": "M",
  "Female": "F",
  "Other": "O",
  "Unspecifieid": "U"
]
