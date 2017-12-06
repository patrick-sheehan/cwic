//
//  API.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/4/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import Foundation

class API {
  
  static func get(uri: String, _ completion: @escaping (_ encodedData: Data) -> Void) {
    let urlString = "http://127.0.0.1:8000/" + uri
    guard let url = URL(string: urlString) else { return }
    
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        print(error!.localizedDescription)
      }
      if let data = data {
        completion(data)
      }
    }
    task.resume()
  }
  
  static func getSponsors(_ completion: @escaping (_ results: [Sponsor]) -> Void) {
    API.get(uri: "sponsors") { data in
      do {
        let list = try JSONDecoder().decode(SponsorList.self, from: data)
        completion(list.results)
      } catch let jsonError {
        print(jsonError)
      }
    }
  }
  
  
  static func getEvents(_ completion: @escaping (_ results: [Event]) -> Void) {
    API.get(uri: "events") { data in
      do {
        let list = try JSONDecoder().decode(EventList.self, from: data)
        completion(list.results)
      } catch let jsonError {
        print(jsonError)
      }
    }
  }
}
