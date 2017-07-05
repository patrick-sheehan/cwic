//
//  UITableView.swift
//  cwic
//
//  Created by Patrick Sheehan on 7/1/17.
//  Copyright © 2017 Síocháin Solutions. All rights reserved.
//

import UIKit

extension UITableView {
  
  func defaultCell(_ object: CustomStringConvertible, canSelect: Bool = false) -> UITableViewCell {
    
    let cell = dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
    
    cell.textLabel?.font = CWIC.Fonts.Lucida
    cell.textLabel?.textColor = CWIC.Colors.RoyalBlue
    cell.textLabel?.text = object.description.capitalized
    
    return cell
  }
}
