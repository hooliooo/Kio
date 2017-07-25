//
//  DoubleExtensions.swift
//  Rapid
//
//  Created by Julio Alorro on 7/24/17.
//  Copyright © 2017 Some Enterprises. All rights reserved.
//

import Foundation

public extension Double {

    /**
     Double as a String
    */
    var stringValue: String {
        return "\(self)"
    }

    /**
     Double as an Integer
    */
    var integerValue: Int {
        return Int(self)
    }

    /**
     Double as a Float
    */
    var floatValue: Float {
        return Float(self)
    }

    /**
     Double as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self)
    }

}
