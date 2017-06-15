//
//  User.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation


enum AccountType {
  case teamLeader
  case teamMember
  case committeeOrganizer
  case visitor
  case sponsor
  case judge
  case artist
}

struct User {

  var accountType: AccountType
  
}
