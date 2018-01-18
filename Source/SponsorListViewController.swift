//
//  SponsorListViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class SponsorListViewController: UITableViewController {
  
  // MARK: - Member Variables
  var sponsors = [Sponsor]()
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Sponsors"
    tableView.register(SponsorCell.self, forCellReuseIdentifier: "Cell")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    refreshData()
  }
  
  
  // MARK: - Networking
  func didFetch(_ sponsors: [Sponsor]) {
    DispatchQueue.main.async {
      self.sponsors = sponsors
      self.tableView.reloadData()
    }
  }
  
  @objc func refreshData() {
    SponsorService.list(didFetch(_:))
  }
  
  
  // MARK: - Table View Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sponsors.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? SponsorCell
      ?? SponsorCell(style: .default, reuseIdentifier: "Cell")
    
    cell.configureCell(sponsors[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let s = sponsors[indexPath.row]
    let vc = SponsorDetailViewController.generate(sponsorId: s.id)
    navigationController?.pushViewController(vc, animated: true)
  }
}
