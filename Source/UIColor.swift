//
//  UIColor.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIColor {
  
  public convenience init?(hexString: String) {
    let r, g, b, a: CGFloat
    
    if hexString.hasPrefix("#") {
      let start = hexString.index(hexString.startIndex, offsetBy: 1)
      let hexColor = String(hexString[start...])
      
      if hexColor.count == 8 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
          g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
          b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
          a = CGFloat(hexNumber & 0x000000ff) / 255
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }
    
    return nil
  }
  
//  convenience init(hex: String) {
//    self.init(hex: hex, alpha:1)
//  }
//  
//  convenience init(hex: String, alpha: CGFloat) {
//    var hexWithoutSymbol = hex
//    if hexWithoutSymbol.hasPrefix("#") {
//      hexWithoutSymbol = hex.substring(1)
//    }
//    
//    let scanner = Scanner(string: hexWithoutSymbol)
//    var hexInt:UInt32 = 0x0
//    scanner.scanHexInt32(&hexInt)
//    
//    var r:UInt32!, g:UInt32!, b:UInt32!
//    switch (hexWithoutSymbol.length) {
//    case 3: // #RGB
//      r = ((hexInt >> 4) & 0xf0 | (hexInt >> 8) & 0x0f)
//      g = ((hexInt >> 0) & 0xf0 | (hexInt >> 4) & 0x0f)
//      b = ((hexInt << 4) & 0xf0 | hexInt & 0x0f)
//      break;
//    case 6: // #RRGGBB
//      r = (hexInt >> 16) & 0xff
//      g = (hexInt >> 8) & 0xff
//      b = hexInt & 0xff
//      break;
//    default:
//      // TODO:ERROR
//      break;
//    }
//    
//    self.init(
//      red: (CGFloat(r)/255),
//      green: (CGFloat(g)/255),
//      blue: (CGFloat(b)/255),
//      alpha:alpha)
//  }
//  
//  convenience init(red: Int, green: Int, blue: Int) {
//    assert(red >= 0 && red <= 255, "Invalid red component")
//    assert(green >= 0 && green <= 255, "Invalid green component")
//    assert(blue >= 0 && blue <= 255, "Invalid blue component")
//    
//    self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
//  }
//  
//  convenience init(netHex:Int) {
//    self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
//  }
  
  
  
}
