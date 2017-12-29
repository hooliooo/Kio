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
    public let int: Int

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

    /**
     Integer as a UInt
     */
    var uintValue: UInt {
        return UInt(self.int)
    }

    /**
     Integer as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.int)
    }

    /**
     Integer as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.int)
    }

    /**
     Integer as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.int)
    }

    /**
     Integer as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.int)
    }

    /**
     Integer as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.int)
    }

    /**
     Integer as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.int)
    }

    /**
     Integer as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.int)
    }

    /**
     Integer as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.int)
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
