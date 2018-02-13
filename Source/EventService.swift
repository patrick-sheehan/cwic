//
//  EventService.swift
//  cwic
//
//  Created by Patrick Sheehan on 10/15/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class EventService {
  
  static let ALL_EVENTS_URL = "\(ApiService.BaseURL)/events/"
  static let STARRED_EVENTS_URL = "\(ApiService.BaseURL)/events/?status=starred"
  static let TRENDING_EVENTS_URL = "\(ApiService.BaseURL)/events/?status=trending"
  
  
  class func list(_ url: String, _ completion: @escaping ([Event]) -> Void) {
    ApiService.request("GET", url, nil) { json in
      guard let results = json["results"] as? [[String: Any]] else {
        PrinterService.error("Failed to get Event list"); return
      }
      completion(results.map { Event(json: $0) })
    }
  }
  
  class func detail(eventId: Int, _ completion: @escaping (Event) -> Void) {
    let urlString = "\(ApiService.BaseURL)/events/\(eventId)/"
    ApiService.request("GET", urlString, nil) {
      completion(Event(json: $0))
    }
  }
  
  class func listAll(_ completion: @escaping ([Event]) -> Void) {
    list(ALL_EVENTS_URL, completion)
  }
  
  class func listStarred(_ completion: @escaping ([Event]) -> Void) {
    list(STARRED_EVENTS_URL, completion)
  }
  
  class func listTrending(_ completion: @escaping ([Event]) -> Void) {
    list(TRENDING_EVENTS_URL, completion)
  }
  
  class func search(_ text: String, completion: @escaping ([Event]) -> Void) {
    let url = "\(ApiService.BaseURL)/events/?search=\(text)"
    list(url, completion)
  }
  
  class func filter(_ category: String, completion: @escaping ([Event]) -> Void) {
    let url = "\(ApiService.BaseURL)/events/?category=\(category)"
    list(url, completion)
  }
  
  class func toggleStar(_ event: Event, completion: @escaping () -> Void) {
    let httpMethod = event.is_starred ? "DELETE" : "PUT"
    let url = "\(ApiService.BaseURL)/events/\(event.id)/star/"
    ApiService.request(httpMethod, url, nil) { _ in
      completion()
    }
  }

  class func comment(_ event: Event, text: String, completion: @escaping () -> Void) {
    let url = "\(ApiService.BaseURL)/events/\(event.id)/comments/"
    ApiService.request("POST", url, ["text": text]) { _ in
      completion()
    }
  }

//  class func addImage(_ challenge: Challenge, image: UIImage, completion: @escaping () -> Void) {
//    let urlString = "\(ApiService.BaseURL)/challenges/\(challenge.id)/image/"
//    ApiService.uploadImage(urlString: urlString, image: image) {
//      completion()
//    }
//  }
//
  class func defaultImage(_ event: Event) -> UIImage? {
    return Cwic.Images.Logo
  }
}
