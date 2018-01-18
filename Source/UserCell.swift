//
//  UserCell.swift
//  Conqube
//
//  Created by Patrick Sheehan on 1/5/18.
//  Copyright © 2018 Síocháin Solutions. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
  
  // MARK: - Member Variables
  var avatarImageView: UIImageView!
  var usernameLabel: UILabel!
  var detailLabel: UILabel!
  var isFriendCheckbox: UIImageView!
  
  func configureCell(_ user: User) {
    
    // Remove old subviews to cell reuse works properly
    contentView.subviews.forEach {
      $0.removeFromSuperview()
    }
    
    let margin: CGFloat = 8.0
    let dblMargin: CGFloat = 2 * margin
    let cellWidth = self.contentView.frame.width
    let cellHeight = self.contentView.frame.height
    let imgLength = cellHeight - dblMargin
    
    let checkboxLength: CGFloat = 40.0
    let checkboxOffsetX = cellWidth - checkboxLength - dblMargin
    let checkboxOffsetY = (cellHeight - checkboxLength) / 2.0

    let labelOffset = imgLength + dblMargin
    let labelWidth = cellWidth - labelOffset - checkboxLength - margin
    let labelHeight = (cellHeight - dblMargin) / 2.0
    
    // Avatar
    avatarImageView = UIImageView(frame: CGRect(x: margin, y: margin, width: imgLength, height: imgLength))
    avatarImageView.image = Cwic.Images.Avatar
    avatarImageView.downloadedFrom(link: user.profile.avatar)
    avatarImageView.round(corners: .allCorners, radius: imgLength / 2)
    
    // Username
    usernameLabel = UILabel(frame: CGRect(x: labelOffset, y: margin, width: labelWidth, height: labelHeight))
    usernameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    usernameLabel.text = user.username
    
    // Detail
    detailLabel = UILabel(frame: CGRect(x: labelOffset, y: labelHeight + margin, width: labelWidth, height: labelHeight))
    detailLabel.font = UIFont.preferredFont(forTextStyle: .body)
    detailLabel.text = user.profile.user_type
    
    // Friendship Checkbox
    isFriendCheckbox = UIImageView(frame: CGRect(x: checkboxOffsetX, y: checkboxOffsetY, width: checkboxLength, height: checkboxLength))
//    isFriendCheckbox.image = user.is_friend ? Cwic.Images.CheckedBox : Cwic.Images.UncheckedBox
    isFriendCheckbox.contentMode = .scaleAspectFit
    
    // Add Subviews
    self.contentView.addSubview(avatarImageView)
    self.contentView.addSubview(usernameLabel)
    self.contentView.addSubview(detailLabel)
    self.contentView.addSubview(isFriendCheckbox)
  }
}

