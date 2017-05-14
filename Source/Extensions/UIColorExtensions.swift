//
//  UIColorExtensions.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import UIKit

public extension UIColor {

    /**
     Convenience initializer for UIColor with an alpha of 1.0

     - parameter red: red value for UIColor

     - parameter green: green value for UIColor

     - parameter blue: blue value for UIColor
     */
    public convenience init(red: UInt8, green: UInt8, blue: UInt8) {
        let red: CGFloat = CGFloat(red) / 255.0
        let green: CGFloat = CGFloat(green) / 255.0
        let blue: CGFloat = CGFloat(blue) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }

    public convenience init(netHex: UInt8) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
