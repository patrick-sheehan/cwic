//
//  EventListViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class EventListViewController: UITableViewController {
  
  // MARK: - Member Variables
  
  var events: [Event] = []
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "Events"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    API.getEvents { results in
      DispatchQueue.main.async {
        self.events = results
        self.tableView?.reloadData()
      }
    }
  }
  
  
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.defaultCell(events[indexPath.row].title, canSelect: true)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    navigationController?.pushViewController(EventViewController.create(event: events[indexPath.row]), animated: true)
  }
}
