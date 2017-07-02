//
//  Sponsor.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class Sponsor: User {
  
  var name: String? = ""
  var url: String? = nil
  
  
  init(_ name: String) {
    super.init()
    
    self.name = name
    self.userType = .sponsor
  }
  
  override var description: String {
    return name ?? ""
  }
  
  var event: Event {
    return Event(.sponsor, object: self)
  }
  
  static let examples: [Sponsor] = [
    Sponsor("Bill's Hardware"),
    Sponsor("Pat's software"),
    Sponsor("Surf's up co"),
    Sponsor("Hormel... No Beans!!"),
    Sponsor("Oleo Learning Co")
  ]
  
  static let CWIC: Sponsor = Sponsor("About CWIC")
}
