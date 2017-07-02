//
//  User.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//


struct Trophy {
  
}


enum Gender {
  case male
  case female
  case notSpecified   // 'prefer not to answer'
}

class User: CustomStringConvertible {

  /// What type of user am I? What access do I have as a result?
  var userType: UserType = .visitor
  
  /// What trophies have I earned?
  var trophies: [Trophy] = []
  
  /// Where am I from?
  var hometown: String?
  
  /// How many years have I been attending?
  var yearsAttended: Int?
  
  /// How did I discover this event?
  var howDiscovered: String?
  
  /// How old am I? (optional)
  var age: Int?
  
  /// What is my gender? (optional)
  var gender: Gender?
  

  var description: String {
    return "\(self.userType)".capitalized
  }
}

enum UserType {
  
  /// Leader of a cook-off team
  /// Manages team profile page
  /// Registers for cook-off
  /// Adds team members
  /// Can purchase QR code tickets for whole team
  case teamLeader
  
  /// Member of a coof-off
  case teamMember
  
  /// Admin-type person that is helping to organize/coordinate this event
  /// Can Push Notify all users if needed (e.g. last minute updates to events
  case committeeOrganizer
  
  /// Guest-type user
  case visitor
  
  /// Person or company that is sponsoring this event
  /// All users can see list of all sponsors with a detailed profile view
  case sponsor
  
  /// Any user can apply to be a judge (of the chili cook-off).
  /// Sponsors get preference
  /// Selected judges are anonymous to others
  /// User type should be a combination of roles
  case judge
  
  /// Usually a musician that has a very public profile and can update event of music lineup
  /// Manages page for their concert
  case artist
  
}

