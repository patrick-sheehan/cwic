//
//  String.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

extension String {
  
  func substring(_ from: Int) -> String {
    return substring(from: characters.index(startIndex, offsetBy: from))
  }
  
  var length: Int {
    return characters.count
  }
}
