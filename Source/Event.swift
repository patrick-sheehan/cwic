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

struct EventType: Codable {
  let code: String
  let name: String
  
  init(_ code: String, _ name: String) {
    self.code = code
    self.name = name
  }
  
  static let All: [EventType] = [
    EventType("A", "Arts & Crafts"),
    EventType("B", "Booth"),
    EventType("C", "Concert"),        // Artist can create Concert for Events page
    EventType("G", "Putt Putt Golf"),
    EventType("I", "Parking"),
    EventType("K", "Cookoff"),
    EventType("L", "Lake"),
    EventType("P", "Park"),
    EventType("R", "Raffle"),         // Users can buy raffle tickets through the app
    EventType("S", "Swimming Pool"),
    EventType("U", "Auction"),        // Need to let users preview auction items
    EventType("W", "Waterslide"),
  ]
}
