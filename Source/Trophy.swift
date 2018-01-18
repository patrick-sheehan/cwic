//
//  Trophy.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/14/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import Foundation

class Trophy {
  let name: String

  init(json: [String: Any]) {
    self.name = json["name"] as? String ?? ""
  }
}
