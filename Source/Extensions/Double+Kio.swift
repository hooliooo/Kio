//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import struct CoreGraphics.CGFloat

/**
 A DSL for Double to access custom methods
*/
public struct KioDoubleDSL {

    // MARK: Stored Propeties
    /**
     Underlying Double instance
    */
    public let double: Double

}

public extension KioDoubleDSL {

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

    /**
     Double as a UInt8
     */
    var uintValue: UInt {
        return UInt(self.double)
    }

    /**
     Double as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.double)
    }

    /**
     Double as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.double)
    }

    /**
     Double as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.double)
    }

    /**
     Double as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.double)
    }

    /**
     Double as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.double)
    }

    /**
     Double as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.double)
    }

    /**
     Double as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.double)
    }

    /**
     Double as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.double)
    }

}

public extension Double {

    /**
     KioDoubleDSL instance to access custom methods
    */
    var kio: KioDoubleDSL {
        return KioDoubleDSL(double: self)
    }

}
