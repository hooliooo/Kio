//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 A DSL for Int to access custom methods
*/
public struct RapidIntDSL {

    // MARK: Stored Propeties
    /**
     Underlying Int instance
    */
    let int: Int

}

public extension RapidIntDSL {

    /**
     Integer as a String
    */
    var stringValue: String {
        return "\(self.int)"
    }

    /**
     Integer as a Double
    */
    var doubleValue: Double {
        return Double(self.int)
    }

    /**
     Integer as a Float
    */
    var floatValue: Float {
        return Float(self.int)
    }

    /**
     Integer as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self.int)
    }
}

public extension Int {

    /**
     RapidIntDSL instance to access custom methods
    */
    var rpd: RapidIntDSL {
        return RapidIntDSL(int: self)
    }
}
