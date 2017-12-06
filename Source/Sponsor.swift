//
//  Sponsor.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

struct Sponsor: Codable {
  let name: String
  let logo: String
  let description: String
}

struct SponsorList: Codable {
  let results: [Sponsor]
}
