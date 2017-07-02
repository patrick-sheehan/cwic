//
//  Date.swift
//  cwic
//
//  Created by Patrick Sheehan on 25/05/16.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

extension Date {
  
  func covertToString() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM-dd-yyyy"
    return dateFormatter.string(from: self)
  }
  
  func convertToUnixTimestamp() -> Int {
    return Int(self.timeIntervalSince1970)
  }
  
  static func fromTimestamp(_ timestamp: Double?) -> Date? {
    
    guard let timestamp = timestamp, timestamp > 0 else {
      return nil
    }
    
    return Date(timeIntervalSince1970: timestamp)
    
  }
}
