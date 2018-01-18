//
//  EventDetailViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 12/22/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class EventDetailViewController: UIViewController {
  
  // MARK: - Member Variables
  var eventId: Int = 0
  var event: Event? = nil
  
  
  struct EventAction {
    let name: String
    
    func perform(_ vc: EventDetailViewController) {
      if name == "View Location of Event" {
        vc.viewLocation()
      } else if name == "Star this Event" {
        vc.toggleStar()
      } else {
        print("TODO")
      }
    }
  }
  
  var actions: [EventAction] = [
    EventAction(name: "View Location of Event"),
    EventAction(name: "Star this Event"),
    EventAction(name: "Upload a picture of this Event"),
    EventAction(name: "Share this Event")
  ]
  
  
  // MARK: - IB Outlets
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var creatorAvatarImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var subtitleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var starButton: UIButton!
  @IBOutlet weak var addImageButton: UIButton!
  @IBOutlet weak var viewLocationButton: UIButton!
  @IBOutlet weak var addCommentButton: UIButton!
  
  
  // MARK: - Initialization
  static func generate(eventId: Int) -> EventDetailViewController {
    let vc = UIViewController.create("EventDetailViewController") as! EventDetailViewController
    vc.eventId = eventId
    return vc
  }
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.dataSource = self
    tableView.delegate = self
    
    starButton.addTarget(self, action: #selector(toggleStar), for: .touchUpInside)
    addImageButton.addTarget(self, action: #selector(addImage), for: .touchUpInside)
    viewLocationButton.addTarget(self, action: #selector(viewLocation), for: .touchUpInside)
    addCommentButton.addTarget(self, action: #selector(addComment), for: .touchUpInside)
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    refreshData()
  }
  
  
  // MARK: - Networking
  func refreshData() {
    EventService.detail(eventId: eventId) { e in
      self.event = e
      DispatchQueue.main.async {
        self.titleLabel.text = e.title
        self.subtitleLabel.text = e.type_verbose
        self.tableView.reloadData()
        self.imageView.downloadedFrom(link: e.image)
        self.starButton.isSelected = e.is_starred
      }
    }
    
  }
  
  
  // MARK: - Actions
  @objc func toggleStar() {
    guard let event = self.event else {
      PrinterService.error("Missing Event"); return
    }
    EventService.toggleStar(event, completion: self.refreshData)
  }
  
  @objc func viewLocation() {
    guard let event = self.event else {
      PrinterService.error("Missing Event"); return
    }
    let vc = UIStoryboard.getViewController(.Position) as! PositionViewController
    vc.position = event.position
    vc.positionTitle = event.title
    vc.positionSubtitle = event.type_verbose
    navigationController?.pushViewController(vc, animated: true)
  }
  
  @objc func addComment() {
    
    guard let event = self.event else {
      PrinterService.error("Missing Event"); return
    }
    
    let alert = UIAlertController(title: "Comment on this Event", message: nil, preferredStyle: .alert)
    alert.addTextField(configurationHandler: { $0.placeholder = "Type your comment here" })
    alert.addAction(UIAlertAction(title: "Submit", style: .default) { _ in
      let commentField = alert.textFields![0] as UITextField
      if let text = commentField.text {
        EventService.comment(event, text: text, completion: self.refreshData)
      }
    })
    alert.addCancelAction()
    self.present(alert, animated: true, completion: nil)
  }
  
  @objc func addImage() {
  }
}


// MARK: - Table View Methods
extension EventDetailViewController: UITableViewDataSource, UITableViewDelegate {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.event?.comments.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
      ?? UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
    if let e = self.event {
      let comment = e.comments[indexPath.row]
      cell.textLabel?.text = comment.text
      cell.detailTextLabel?.text = comment.creationDescription
    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Comments"
  }
}
