//
//  UIStoryboard.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

extension UIStoryboard {
  
  /// Main.storyboard identifiers for custom ViewControllers
  enum Id: String {
    case Profile = "ProfileViewController"
    case Event = "EventViewController"
    case ImageTextList = "ImageTextListViewController"
  }
  
  /// Get a view controller instance for the given storyboard id
  static func getViewController(_ storyboardId: Id) -> UIViewController {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewController(withIdentifier: storyboardId.rawValue)
  }
  
}
