//
//  ImageTextListViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 12/6/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class ImageTextListViewController: UIViewController {
  
  
  // MARK: - Member Variables
  var text: String?
  var imageLink: String?
  var tableViewDelegate: UITableViewDelegate?
  var tableViewDataSource: UITableViewDataSource?
  
  
  // MARK: - IB Outlets
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var textView: UITextView!
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var textViewHeight: NSLayoutConstraint!
  
  
  // MARK: - View Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    navigationItem.title = self.title
    
    if let link = imageLink {
      imageView.downloadedFrom(link: link)
    }
    
    if let text = text {
      textViewHeight.constant = 250
      textView.text = text
    } else {
      textViewHeight.constant = 0
    }
  }
}
