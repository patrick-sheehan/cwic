//
//  EventSegmentsViewController.swift
//  CWIC
//
//  Created by Patrick Sheehan on 1/20/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import SJSegmentedScrollView

class EventSegmentsViewController {
  
  class var segments: [UITableViewController] {
    return [
      // Starred
      StarredEventListViewController.generate(),
      
      // Trending
      TrendingEventListViewController.generate(),
      
      // All
//      UserStrangerListViewController.generate(),
      
      // Categorical
//      UserInvitesSentListViewController.generate(),
    ]
  }
  
  class func generate() -> UIViewController {
    let segmentView = SJSegmentedViewController(headerViewController: nil, segmentControllers: segments)
    segmentView.title = "Events"
//    segmentView.headerViewHeight = 0
//    segmentView.headerViewOffsetHeight = 0
    segmentView.selectedSegmentViewColor = .white
    segmentView.segmentBackgroundColor = Cwic.Blue
    segmentView.segmentTitleColor = .white
    segmentView.segmentTitleFont = Cwic.Font
    return segmentView
  }
}

