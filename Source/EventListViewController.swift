//
//  EventListViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class EventListViewController: UITableViewController, UISearchBarDelegate {
  
  // MARK: - Member Variables
  private let searchController = UISearchController(searchResultsController: nil)
  var events = [Event]()
  var endpointUrl: String = EventService.ALL_EVENTS_URL
  
  // MARK: - Networking
  func didFetch(_ events: [Event]) {
    DispatchQueue.main.async {
      self.events = events
      self.tableView.reloadData()
    }
  }
  
  @objc func refreshData() {
    EventService.list(endpointUrl, didFetch(_:))
  }
  
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    title = "Events"
    
    configureFilterButton()
    configureSearchBar()
    
    tableView.register(EventCell.self, forCellReuseIdentifier: "Cell")
  }
  
  func configureSearchBar() {
    searchController.searchBar.delegate = self
    searchController.dimsBackgroundDuringPresentation = false
    definesPresentationContext = true
    tableView.tableHeaderView = searchController.searchBar
  }
  
  func configureFilterButton() {
    navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Category", style: .plain, target: self,
      action: #selector(selectFilter(_:)))
  }
  
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    refreshData()
  }
  
  
  // MARK: - Table View Methods
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return events.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? EventCell
      ?? EventCell(style: .default, reuseIdentifier: "Cell")
    
    cell.configureCell(events[indexPath.row])
    return cell
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let event = events[indexPath.row]
    let vc = EventDetailViewController.generate(eventId: event.id)
    navigationController?.pushViewController(vc, animated: true)
  }
  
  
  // MARK: - Filter Methods
  @objc func selectFilter(_ sender: UIBarButtonItem) {
    present(filterDialog, animated: true, completion: nil)
  }
  
  func didSelectFilter(_ category: String) {
    EventService.filter(category, completion: self.didFetch(_:))
  }
  
  lazy var filterDialog: UIAlertController = {
    
    let alert = UIAlertController(title: "Category", message: nil, preferredStyle: .actionSheet)
    
    alert.addAction(UIAlertAction(title: "All", style: .default) { _ in
      self.resetSearch()
    })
    
    alert.addAction(UIAlertAction(title: "Trending", style: .default) { _ in
      EventService.listTrending(self.didFetch(_:))
    })
    
    alert.addAction(UIAlertAction(title: "Starred", style: .default) { _ in
      EventService.listStarred(self.didFetch(_:))
    })
    
    Categories.keys.forEach { category in
      alert.addAction(UIAlertAction(title: category, style: .default) { _ in
        if let categoryCode = Categories[category] {
          self.didSelectFilter(categoryCode)
        } else {
          self.resetSearch()
        }
      })
    }
    
    // Set popover controller
    alert.popoverPresentationController?.barButtonItem = self.navigationItem.rightBarButtonItem
    return alert.withCancelAction()
  }()
  
  
  // MARK: - Search Methods
  func resetSearch() {
    EventService.listAll(didFetch(_:))
  }
  
  func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    resetSearch()
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let text = searchBar.text else { return }
    EventService.search(text, completion: self.didFetch(_:))
  }
}
