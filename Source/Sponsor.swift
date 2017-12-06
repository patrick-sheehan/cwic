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
}

struct SponsorList: Codable {
  let results: [Sponsor]
}

//  static let CWIC = Sponsor("About CWIC",
//                            imageName: "cwic-large",
//                            about: CWIC_ABOUT_TEXT)
//}
//
//let CWIC_ABOUT_TEXT = "Did you know..... 22 soldiers KBS per day. Whats KBS? Killed by suicide. 22 per DAY. The root cause is that a vet returning from a war zone simply has no tools to cope with the fact that they aren't in a war zone any more. They are unable to transition. So this year we,The Chili When Its Chilly Cook-Off Committee, have decided to raise awareness and raise money for The ReBoot Program with the Boot Campaign, which tackles the root cause of the struggles affecting so many of our brave servicemen and women, and brings together world class mental and physical treatment for them. Making them whole again. Thats 22 Moms and Dads who WON'T suffer the loss of their soldier by suicide. I want that number to be ZERO and I hope you do too. CWIC will always work to fulfill a solitary goal of helping folks who need it. Being blessed to be a part of doing good for others is a calling we accept, so the Board of Directors of A MAJOR FUNDING with the Executive Committee for CWIC will continue to seek out and work with charitable organizations who share our vision of grass-roots efforts to directly help those who need it, with as little overhead as possible to ensure the donation is put to good use. We remain committed to our cause, and are appreciative of the sponsors, supporters, and participants who share in our mission to help those in need. ALL PROFITS GO TO THE CHARITY, there are no paid staff associated with any part of this event."
