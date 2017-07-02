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
  
  var event: Event?
  
  
  // MARK: - IB Outlets
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var tableView: UITableView!
  
  
  // MARK: - View Lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = event?.description
  }
  
  
  static func create(event: Event) -> EventViewController {
    let vc = UIStoryboard.getViewController(.Event) as! EventViewController
    vc.event = event
    return vc
  }
}
