//
//  CommitteeMemberListViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/18/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//


import UIKit

class CommitteeMemberListViewController: UITableViewController {
  
  // MARK: - Member Variables
  var users = [User]()

  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UserCell.self, forCellReuseIdentifier: "Cell")
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    self.refreshData()
  }
  
  
  // MARK: - Networking
  func didFetch(_ users: [User]) {
    DispatchQueue.main.async {
      self.users = users
      self.tableView.reloadData()
    }
  }
  
  @objc func refreshData() {
    UserService.listCommitteeMembers(didFetch(_:))
  }
  
  
  // MARK: - Table View Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? UserCell
      ?? UserCell(style: .default, reuseIdentifier: "Cell")
    
    cell.configureCell(users[indexPath.row])
    return cell
  }
}
