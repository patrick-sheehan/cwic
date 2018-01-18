//
//  Constants.swift
//  Conqube
//
//  Created by Patrick Sheehan on 1/5/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import UIKit

class Cwic {
  static let Red = UIColor(hexString: "#ce171fff")!
  static let Black = UIColor(hexString: "#040707ff")!
  static let Blue = UIColor(hexString: "#1f11a5ff")!
  
  static let Font = UIFont(name: "LucidaGrande", size: 16.0)!
  
  struct UrlStrings {
    static let Facebook = "https://www.facebook.com/Chili-When-Its-Chilly-454168927984431/"
    static let Twitter = "https://twitter.com/CWIC1"
    static let Instagram = "https://www.instagram.com/chiliwhenitschilly"
  }
  
  struct Images {
    static let Avatar = UIImage(named: "Avatar")!
    static let Star = UIImage(named: "Star")!
    static let RedStar = UIImage(named: "RedStar")!
    static let Logo = UIImage(named: "Logo")!
  }
}

enum TabImages {
  static let Profile = UIImage(named: "Profile")!
  static let Events = UIImage(named: "Events")!
  static let About = UIImage(named: "About")!
  static let Sponsors = UIImage(named: "Sponsors")!
  static let Timeline = UIImage(named: "Timeline")!
}

let CORNER_RADIUS: CGFloat = 10.0
let OVERLAY_ALPHA: CGFloat = 0.8
let MARGIN_DEFAULT: CGFloat = 20.0

func randomInt(max: UInt32) -> Int {
  return Int(arc4random_uniform(max))
}
