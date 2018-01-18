//
//  Sponsor.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class Sponsor {
  var id: Int
  let name: String
  let description: String
  let logo: String
  
  init(json: [String: Any]) {
    self.id = json["id"] as? Int ?? 0
    self.name = json["name"] as? String ?? ""
    self.description = json["description"] as? String ?? ""
    self.logo = json["logo"] as? String ?? ""
  }
}
