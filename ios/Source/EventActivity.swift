//
//  EventActivity.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation
import UIKit

enum EventActivityType {
  
  enum Complex {
    case auction  // Need to let users preview auction items
    case concert  // Artist should be able to make a concert, and include it in events page
    case cookoff  // TODO: needs most thought, include recipes,
    case raffle   // Users can buy raffle tickets through the app
    case users    // Want to see where friends are
  }
  
  
  /// Mainly just locations
  enum Simple {
    case artsCrafts
    case booth
    case lake
    case park
    case parking
    case puttPutt
    case swimmingPool
    case waterSlide
  }
}


struct EventActivity {
  var eventActivityType: EventActivityType
  var date: Date
  
  
  func uploadPhoto(image: UIImage) {
    fatalError("Not implemented")
  }
}
