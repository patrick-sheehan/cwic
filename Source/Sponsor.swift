//
//  Sponsor.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class Sponsor: User {
  
  var aboutText: String? = nil
  var url: String? = nil
  
  init(_ name: String, imageName: String, about: String?) {
    
    super.init(name, UIImage(named: imageName))
    
    self.aboutText = about
    self.userType = .sponsor
    
  }
  
  var event: Event {
    return Event(.sponsor, object: self, image: image, aboutText: aboutText)
  }
  
  static let CWIC = Sponsor("About CWIC",
                            imageName: "cwic-large",
                            about: "CWIC 17 will be donating all proceeds to the ReBoot Program within the Boot Campaign.")
}
