//
//  PrinterService.swift
//  CWIC
//
//  Created by Patrick Sheehan on 4/2/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class PrinterService {
  
  // MARK: - Variables
  
  /// Get string of log history entries, each on a new line
  private static var LogHistory = [String]()
  class var getLogHistory: String {
    return LogHistory.reduce("") { "\($0)\n\($1)" }
  }
  
  
  // Mark: - Functions
  
  /// Convenience when providing exactly one tag
  class func log(_ msg: String, _ tag: String) {
    log(msg, [tag])
  }
  
  /// Any log message with >0 tags
  class func log(_ msg: String, _ tags: [String] = []) {
    let strTags = tags.reduce("") { "\($0)[\($1)] " }
    let entry = "\(strTags)\(msg)"
    DispatchQueue.main.async {
      LogHistory.append(entry)
      print("[Conqube] \(entry)")
    }
  }
  
  class func log(_ data: Data, _ tags: [String] = []) {
    log(String(data: data, encoding: String.Encoding.utf8) ?? "Data could not be printed")
  }
  
  /// Error log message with only one tag
  class func error(_ msg: String, _ tag: String? = nil) {
    if let tag = tag {
      log(msg, [tag, "ERROR"])
    } else {
      log(msg, "ERROR")
    }
  }
}
