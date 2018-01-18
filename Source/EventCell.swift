//
//  EventCell.swift
//  Conqube
//
//  Created by Patrick Sheehan on 1/4/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {
  
  // Define label, textField etc
  var titleLabel: UILabel!
  var detailLabel: UILabel!
  
  // Setup your objects
  func configureCell(_ event: Event) {
    
    // Remove old subviews to cell reuse works properly
    contentView.subviews.forEach {
      $0.removeFromSuperview()
    }
    
    let margin: CGFloat = 12.0
    let cellWidth = self.contentView.frame.width
    let labelWidth = cellWidth - CGFloat(2 * margin)
    
    // Title
    titleLabel = UILabel(frame: CGRect(x: margin, y: 0, width: labelWidth, height: 40))
    titleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    titleLabel.text = event.title
    
    // Detail
    detailLabel = UILabel(frame: CGRect(x: margin, y: 40, width: labelWidth, height: 25))
    detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
    detailLabel.text = event.type_verbose
    
    self.contentView.addSubview(titleLabel)
    self.contentView.addSubview(detailLabel)
  }
}
