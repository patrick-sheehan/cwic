//
//  ProfileViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/15/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var usernameLabel: UILabel!
  @IBOutlet weak var viewTrophiesButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  var actions: [String] = [
    "Edit Profile",
    "My Tickets",
    "My Pages",
    "Send Push Notification",
    "Become a Judge"
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    
    navigationItem.title = "My Profile"
  }
}

extension ProfileViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return actions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    return tableView.defaultCell(actions[indexPath.row])
  }
}
