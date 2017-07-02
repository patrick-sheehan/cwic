//
//  EventViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {
  
  
  // MARK: - Member Variables
  
  var event: Event!
  
  
  // MARK: - IB Outlets
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = event?.description
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  
  static func create(event: Event) -> EventViewController {
    let vc = UIStoryboard.getViewController(.Event) as! EventViewController
    vc.event = event
    return vc
  }
}

extension EventViewController: UITableViewDataSource, UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return event.actions.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.defaultCell(event.actions[indexPath.row])
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let action = event.actions[indexPath.row]
    showPopupInfo("'\(action)' coming soon!")
    
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
