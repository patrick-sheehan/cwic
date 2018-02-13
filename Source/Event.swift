//
//  Event.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class Comment {
  let text: String
  let creator: String
  let created: String
  
  init(json: [String: Any]) {
    self.text = json["text"] as! String
    self.creator = json["creator"] as! String
    self.created = json["created"] as! String
  }
  
  var creationDescription: String {
    return "By: \(creator) ... \(created)"
  }
}


class Event {
  var id: Int
  let title: String
  let description: String
  let type_verbose: String
  let image: String
  let position: Position?
  let is_starred: Bool
  let comments: [Comment]
  
  init(json: [String: Any]) {
    self.id = json["id"] as? Int ?? 0
    self.title = json["title"] as? String ?? ""
    self.description = json["description"] as? String ?? ""
    self.type_verbose = json["type_verbose"] as? String ?? ""
    self.image = json["image"] as? String ?? ""
    self.is_starred = json["is_starred"] as? Bool ?? false
    
    if let positionJson = json["position"] as? [String: Any] {
      self.position = Position(json: positionJson)
      PrinterService.log("Got a position: \(self.position!)")
    } else {
      self.position = nil
    }
    
    
    if let commentsJson = json["comments"] as? [[String: Any]] {
      self.comments = commentsJson.map({ Comment(json: $0) })
    } else {
      self.comments = []
    }
  }
}

let Categories: [String: String] = [
  "Arts & Crafts": "A",
  "Booth": "B",
  "Concert": "C",
  "Putt Putt Golf": "G",
  "Parking": "I",
  "Cookoff": "K",
  "Lake": "L",
  "Park": "P",
  "Raffle": "R",
  "Swimming Pool": "S",
  "Auction": "U",
  "Waterslide": "W",
]
