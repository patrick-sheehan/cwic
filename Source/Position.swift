//
//  Position.swift
//  CWIC
//
//  Created by Patrick Sheehan on 12/6/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

struct Position {
  let lat: Double
  let lon: Double
  
  init?(json: [String: Any]) {
    
    PrinterService.log(json.debugDescription)
    guard let lat = json["lat"] as? Double,
      let lon = json["lon"] as? Double else {
        return nil
    }
    
    self.lat = lat
    self.lon = lon
  }
}

