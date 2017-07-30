//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

public struct RapidDoubleDSL {

    // MARK: Stored Propeties
    /**
     Underlying Int instance
    */
    let double: Double

}

public extension RapidDoubleDSL {

    /**
     Double as a String
    */
    var stringValue: String {
        return "\(self.double)"
    }

    /**
     Double as an Integer
    */
    var integerValue: Int {
        return Int(self.double)
    }

    /**
     Double as a Float
    */
    var floatValue: Float {
        return Float(self.double)
    }

    /**
     Double as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self.double)
    }

}

public extension Double {

    /**
     RapidDoubleDSL instance to access custom methods
    */
    var rpd: RapidDoubleDSL {
        return RapidDoubleDSL(double: self)
    }

}
