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
  
  lazy var actions: [Action] = {
    return [
      Action("Edit Profile", viewController: self),
      Action("My Tickets", viewController: self),
      Action("My Pages", viewController: self),
      Action("Send Push Notification", viewController: self),
      Action("Become a Judge", viewController: self)
    ]
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    navigationItem.title = "My Profile"
    
    viewTrophiesButton.addTarget(self, action: #selector(viewTrophies), for: .touchUpInside)
  }
  
  func viewTrophies() {
    showPopupInfo("'Trophies' coming soon!")
  }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return actions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.defaultCell(actions[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let action = actions[indexPath.row]
    showPopupInfo("'\(action)' coming soon!")
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
