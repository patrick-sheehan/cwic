//
//  StarredEventListViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/20/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import UIKit

class StarredEventListViewController: EventListViewController {
  
  // MARK: - Initialization
  static func generate() -> StarredEventListViewController {
    let vc = StarredEventListViewController()
    vc.title = "STARRED"
    vc.endpointUrl = EventService.STARRED_EVENTS_URL
    return vc
  }
}
