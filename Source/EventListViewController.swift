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
  var uri: String = API.getEventsUriHelper()
  

  // MARK: - Initializer
  
  convenience init(title: String, uri: String, showFilterButton: Bool = false) {
    self.init()
    self.title = title
    self.uri = uri
    self.navigationItem.title = self.title
    self.navigationItem.rightBarButtonItem = showFilterButton ? editButtonItem : nil
  }
  
  
  // MARK: - View Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    self.fetchData()
  }
  
  func fetchData(other_uri: String? = nil) {
    
    API.getEvents(uri: other_uri ?? self.uri) { results in
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
    let vc = UIStoryboard.getViewController(.Position) as! PositionViewController
    
    let event = events[indexPath.row]
    vc.position = event.position
    vc.positionTitle = event.title
    vc.positionSubtitle = event.type_verbose
    
    navigationController?.pushViewController(vc, animated: true)
  }
  
  
  // MARK: - Filtering
  
  @objc func showDialog(_ sender: UIBarButtonItem) {
    dialog.popoverPresentationController?.barButtonItem = sender
    present(dialog, animated: true, completion: nil)
  }
  
  
  override var editButtonItem: UIBarButtonItem {
    return UIBarButtonItem(title: "Filter",
                           style: .plain,
                           target: self,
                           action: #selector(showDialog(_:)))
  }
  
  lazy var dialog: UIAlertController = {
    let message = "Filter events by category"
    var alert = UIAlertController(title: message, message: nil, preferredStyle: .actionSheet)
    
    for type in EventType.All {
      alert.addAction(UIAlertAction(title: type.name, style: .default) { _ in
        let other_uri = API.getEventsUriHelper(filter: .type, type: type)
        self.fetchData(other_uri: other_uri)
      })
    }
    
    return alert.withCancelAction()
  }()
  
}
