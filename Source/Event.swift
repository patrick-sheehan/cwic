//
//  Event.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

struct Event: Codable {
  let title: String
  let description: String
  let position: Position?
  let type_verbose: String
}

struct EventList: Codable {
  let results: [Event]
}

enum EventType {
  case sponsor
  case auction  // Need to let users preview auction items
  case concert  // Artist should be able to make a concert, and include it in events page
  case cookoff  // TODO: needs most thought, include recipes,
  case raffle   // Users can buy raffle tickets through the app
  case artsCrafts
  case booth
  case lake
  case park
  case parking
  case puttPutt
  case swimmingPool
  case users        // Want to see where friends are
  case waterSlide
}
