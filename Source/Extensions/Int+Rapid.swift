//
//  IntExtensions.swift
//  Rapid
//
//  Created by Julio Alorro on 7/24/17.
//  Copyright (c) 2017 Some Enterprises. All rights reserved.
//

import Foundation

public extension Int {

    /**
     Integer as a String
    */
    var stringValue: String {
        return "\(self)"
    }

    /**
     Integer as a Double
    */
    var doubleValue: Double {
        return Double(self)
    }

    /**
     Integer as a Float
    */
    var floatValue: Float {
        return Float(self)
    }

    /**
     Integer as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self)
    }
}
