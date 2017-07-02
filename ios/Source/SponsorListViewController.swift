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
  
  let sponsors = Sponsor.examples
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Sponsors"
  }
  
  
  // MARK: - Table View Methods

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sponsors.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.defaultCell(sponsors[indexPath.row].description, canSelect: true)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = EventViewController.create(event: sponsors[indexPath.row].event)
    navigationController?.pushViewController(vc, animated: true)
  }
}
