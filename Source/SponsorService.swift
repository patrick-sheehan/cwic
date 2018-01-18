//
//  SponsorService.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/14/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//


class SponsorService {
  
  static let SPONSORS_URL = "\(ApiService.BaseURL)/sponsors/"
  
  class func list(_ completion: @escaping ([Sponsor]) -> Void) {
    ApiService.request("GET", SPONSORS_URL, nil) { json in
      guard let results = json["results"] as? [[String: Any]] else {
        PrinterService.error("Failed to get Sponsor list"); return
      }
      completion(results.map { Sponsor(json: $0) })
    }
  }
  
  class func detail(sponsorId: Int, _ completion: @escaping (Sponsor) -> Void) {
    let urlString = "\(SPONSORS_URL)/\(sponsorId)/"
    ApiService.request("GET", urlString, nil) {
      completion(Sponsor(json: $0))
    }
  }
}
