//
//  API.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/4/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import SwiftyJSON


class API {
  
  static func getSponsors(_ completion: (_ sponsors: [Sponsor]) -> Void) {
    
    if let path = Bundle.main.path(forResource: "sponsors", ofType: "json") {
      do {
        let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
        let jsonObj = try JSON(data: data)
        if jsonObj != JSON.null {
          if let arr = jsonObj.array {
            
            let sponsors = arr.map{
              Sponsor($0["name"].stringValue,
                      imageName: $0["image"].stringValue,
                      about: $0["about"].string)
            }
            
            completion(sponsors)
          }
        } else {
          print("Could not get json from file, make sure that file contains valid json.")
        }
      } catch let error {
        print(error.localizedDescription)
      }
    } else {
      print("Invalid filename/path.")
    }
    
    
    
  }
}

