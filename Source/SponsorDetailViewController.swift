//
//  SponsorDetailViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/14/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//


import UIKit

class SponsorDetailViewController: UIViewController {
  
  // MARK: - Member Variables
  var sponsorId: Int = 0
  var sponsor: Sponsor? = nil
  
  // MARK: - IB Outlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var textViewHeight: NSLayoutConstraint!
  
  
  // MARK: - Initialization
  static func generate(sponsorId: Int) -> SponsorDetailViewController {
    let vc = UIViewController.create("SponsorDetailViewController") as! SponsorDetailViewController
    vc.sponsorId = sponsorId
    return vc
  }
  
  
  // MARK: - Networking
  func refreshData() {
    SponsorService.detail(sponsorId: sponsorId) { s in
      self.sponsor = s
      DispatchQueue.main.async {
        self.title = s.name
        
        // Sponsor Description
        if s.description.isEmpty {
          self.textViewHeight.constant = 0
        } else {
          self.textViewHeight.constant = 250
          self.textView.text = s.description
        }
        
        // Sponsor logo
//        let imgLength = self.imageView.frame.width
        self.imageView.downloadedFrom(link: s.logo)
        self.imageView.round(corners: .allCorners, radius: 10)
      }
    }
  }
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    refreshData()
  }
}


// MARK: - Table View Methods (for actions at the bottom)
extension SponsorDetailViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
    //    return event.actions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
    //    return tableView.defaultCell(event.actions[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    let action = event.actions[indexPath.row]
    //    showPopupInfo("'\(action)' coming soon!")
    //
    //    tableView.deselectRow(at: indexPath, animated: true)
  }
}
