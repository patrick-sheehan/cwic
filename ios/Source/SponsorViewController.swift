//
//  SponsorViewController.swift
//  cwic
//
//  Created by Patrick Sheehan on 6/14/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

class SponsorViewController: EventViewController {
  
  
  // MARK: - Member Variables
  
  var sponsor: User!
  
  
  // MARK: - View Lifecycle
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    titleLabel.text = sponsor.description
  }
}
