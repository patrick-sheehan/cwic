//
//  Event.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation
import UIKit

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


class Event: CustomStringConvertible {
  
  var type: EventType
  var name: String
  var date: Date?
  var image: UIImage?
  var aboutText: String?
  
  var description: String {
    return name
  }
  
  func uploadPhoto(image: UIImage) {
    fatalError("Not implemented")
  }
  
  init(_ type: EventType, object: CustomStringConvertible, date: Date? = nil, imageName: String = "", aboutText: String? = nil) {
    self.type = type
    self.name = object.description
    self.date = date
    self.image = UIImage(named: imageName)
    self.aboutText = aboutText
  }
  
  var actions: [Action] {
    return [
      
    ]
  }
  
}

extension Event {
  
  static let examples = [
    Event(.auction, object: "Silent Auction", imageName: "auction.png"),
    Event(.concert, object: "Lynyrd Skynyrd", imageName: "concert.jpg"),
    Event(.cookoff, object: "Chili Cookoff Competition", imageName: "cookoff.jpg"),
    Event(.raffle, object: "$1 raffle for new iPod", imageName: "raffle.jpg"),
    Event(.artsCrafts, object: "Make your own dream catcher!", imageName: "artsCrafts.jpg"),
    Event(.booth, object: "Free Hugs Booth!", imageName: "booth.jpg"),
    Event(.lake, object: "Jump in the lake from a rope swing!", imageName: "lake.jpg"),
    Event(.park, object: "Come swing with your friends and grill some steaks", imageName: "park.jpg"),
    Event(.parking, object: "Click here to learn about parking", imageName: "parking.jpg"),
    Event(.puttPutt, object: "Putt putt golf with your sweetheart", imageName: "puttPutt.jpg"),
    Event(.swimmingPool, object: "Checkout the pool's waterslide and diving board!", imageName: "swimmingPool.jpg"),
    Event(.waterSlide, object: "Brand new water slide at the swimming pool!", imageName: "waterSlide.jpg")
  ]
}
