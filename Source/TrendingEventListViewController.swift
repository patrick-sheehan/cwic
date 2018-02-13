//
//  TrendingEventListViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/20/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import UIKit

class TrendingEventListViewController: EventListViewController {
  
  // MARK: - Initialization
  static func generate() -> TrendingEventListViewController {
    let vc = TrendingEventListViewController()
    vc.title = "TRENDING"
    vc.endpointUrl = EventService.TRENDING_EVENTS_URL
    return vc
  }
}


