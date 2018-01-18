//
//  ProfileViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/15/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import SJSegmentedScrollView

class ProfileViewController {
  
  class var listSegments: [UITableViewController] {
    return [
      TrophyListViewController(),
      EventListViewController()
    ]
  }
  
  class func generate(delegate: AuthDelegate) -> UIViewController {
    let header = UIViewController.create("ProfileHeaderViewController") as! ProfileHeaderViewController
    header.delegate = delegate
    
    let segmentView = SJSegmentedViewController(headerViewController: header, segmentControllers: listSegments)
    segmentView.title = "Profile"
    segmentView.headerViewHeight = 80.0
    segmentView.headerViewOffsetHeight = -80.0
    segmentView.selectedSegmentViewColor = .white
    segmentView.segmentBackgroundColor = Cwic.Blue
    segmentView.segmentTitleColor = .white
    segmentView.segmentTitleFont = Cwic.Font
    segmentView.navigationItem.rightBarButtonItem = UIBarButtonItem(
      title: "Edit", style: .plain, target: header,
      action: #selector(ProfileHeaderViewController.viewEdit))
    segmentView.navigationItem.leftBarButtonItem = UIBarButtonItem(
      title: "Logout", style: .plain, target: delegate,
      action: #selector(AuthDelegate.goToLogin))
    return segmentView
  }
}
//  lazy var actions: [Action] = {
//    return [
//      Action("Edit Profile", viewController: self),
//      Action("My Tickets", viewController: self),
//      Action("My Pages", viewController: self),
//      Action("Send Push Notification", viewController: self),
//      Action("Become a Judge", viewController: self)
//    ]
//  }()

