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


// MARK: - Table View Methods (for actions at the bottom)
extension ImageTextListViewController: UITableViewDataSource, UITableViewDelegate {
  
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
