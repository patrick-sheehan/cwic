//
//  AboutCwicViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/14/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import UIKit

class AboutCwicViewController: UIViewController {
  
  @IBOutlet weak var viewCommitteeButton: UIButton!
  @IBOutlet weak var aboutCharityButton: UIButton!
  @IBOutlet weak var aboutCookoffButton: UIButton!
  @IBOutlet weak var contactView: UIView!
  
  @IBOutlet weak var facebookButton: UIButton!
  @IBOutlet weak var instagramButton: UIButton!
  @IBOutlet weak var twitterButton: UIButton!
  @IBOutlet weak var mailingListButton: UIButton!
  
  
  class func generate() -> UIViewController {
    return UIViewController.create("AboutCwicViewController")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "About"
    
    let views = [viewCommitteeButton, aboutCharityButton, aboutCookoffButton]
    views.forEach {
      $0?.layer.cornerRadius = 15
      $0?.layer.borderWidth = 1
      $0?.layer.borderColor = UIColor.black.cgColor
    }
    
    viewCommitteeButton.addTarget(self, action: #selector(viewCommitteeAction), for: .touchUpInside)
    aboutCharityButton.addTarget(self, action: #selector(aboutCharityAction), for: .touchUpInside)
    aboutCookoffButton.addTarget(self, action: #selector(aboutCookoffAction), for: .touchUpInside)
    facebookButton.addTarget(self, action: #selector(facebookAction), for: .touchUpInside)
    instagramButton.addTarget(self, action: #selector(instagramAction), for: .touchUpInside)
    twitterButton.addTarget(self, action: #selector(twitterAction), for: .touchUpInside)
    mailingListButton.addTarget(self, action: #selector(mailingListAction), for: .touchUpInside)
  }
  
  @objc func viewCommitteeAction() {
    let vc = CommitteeMemberListViewController()
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func aboutCharityAction() {
    self.showPopupError("Whoops! Charity info coming soon!")
  }
  
  @objc func aboutCookoffAction() {
    self.showPopupError("Whoops! Cook-off info coming soon!")
  }
  
  @objc func facebookAction() {
    guard let url = URL(string: Cwic.UrlStrings.Facebook) else { return }
    if UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url, options: [:]) { _ in }
    } else {
      PrinterService.error("Failed to open Facebook")
    }
  }
  
  @objc func instagramAction() {
    guard let url = URL(string: Cwic.UrlStrings.Instagram) else { return }
    if UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url, options: [:]) { _ in }
    } else {
      PrinterService.error("Failed to open Instagram")
    }
  }
  
  @objc func twitterAction() {
    guard let url = URL(string: Cwic.UrlStrings.Twitter) else { return }
    if UIApplication.shared.canOpenURL(url) {
      UIApplication.shared.open(url, options: [:]) { _ in }
    } else {
      PrinterService.error("Failed to open Twitter")
    }
    
  }
  
  @objc func mailingListAction() {
    self.showPopupError("Whoops! Mailing list subscription coming soon!")
  }
}





//Did you know..... 22 soldiers KBS per day. Whats KBS? Killed by suicide. 22 per DAY. The root cause is that a vet returning from a war zone simply has no tools to cope with the fact that they aren't in a war zone any more. They are unable to transition. So this year we,The Chili When Its Chilly Cook-Off Committee, have decided to raise awareness and raise money for The ReBoot Program with the Boot Campaign, which tackles the root cause of the struggles affecting so many of our brave servicemen and women, and brings together world class mental and physical treatment for them. Making them whole again. Thats 22 Moms and Dads who WON'T suffer the loss of their soldier by suicide. I want that number to be ZERO and I hope you do too. CWIC will always work to fulfill a solitary goal of helping folks who need it. Being blessed to be a part of doing good for others is a calling we accept, so the Board of Directors of A MAJOR FUNDING with the Executive Committee for CWIC will continue to seek out and work with charitable organizations who share our vision of grass-roots efforts to directly help those who need it, with as little overhead as possible to ensure the donation is put to good use. We remain committed to our cause, and are appreciative of the sponsors, supporters, and participants who share in our mission to help those in need. ALL PROFITS GO TO THE CHARITY, there are no paid staff associated with any part of this event.

