//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import struct CoreGraphics.CGFloat

/**
 A DSL for UInt to access custom methods
 */
public struct KioUIntDSL {

    // MARK: Stored Propeties
    /**
     Underlying Int instance
     */
    public let uint: UInt

}

public extension KioUIntDSL {

    /**
     UInt as a String
    */
    var stringValue: String {
        return "\(self.uint)"
    }

    /**
     UInt as a Double
    */
    var doubleValue: Double {
        return Double(self.uint)
    }

    /**
     UInt as a Float
    */
    var floatValue: Float {
        return Float(self.uint)
    }

    /**
     UInt as a CGFloat
    */
    var cgFloatValue: CGFloat {
        return CGFloat(self.uint)
    }

    /**
     UInt as a Int
    */
    var intValue: Int {
        return Int(self.uint)
    }

    /**
     UInt as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.uint)
    }

    /**
     UInt as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.uint)
    }

    /**
     UInt as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.uint)
    }

    /**
     UInt as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.uint)
    }

    /**
     UInt as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.uint)
    }

    /**
     UInt as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.uint)
    }

    /**
     UInt as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.uint)
    }

    /**
     UInt as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.uint)
    }
}

public extension UInt {

    /**
     KioUIntDSL instance to access custom methods
    */
    var kio: KioUIntDSL {
        return KioUIntDSL(uint: self)
    }
}
