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
    
  }
  
  @objc func aboutCookoffAction() {
    
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
    
  }
}
