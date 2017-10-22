//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

/**
 A DSL for Float to access custom methods
 */
public struct RapidCGFloatDSL {

    // MARK: Stored Propeties
    /**
     Underlying CGFloat instance
    */
    public let cgFloat: CGFloat

}

public extension RapidCGFloatDSL {

    /**
     CGFloat as a String
    */
    var stringValue: String {
        return "\(self.cgFloat)"
    }

    /**
     CGFloat as an Integer
    */
    var integerValue: Int {
        return Int(self.cgFloat)
    }

    /**
     CGFloat as a Double
    */
    var doubleValue: Double {
        return Double(self.cgFloat)
    }

    /**
     CGFloat as a Float
    */
    var floatValue: Float {
        return Float(self.cgFloat)
    }

    /**
     CGFloat as a UInt8
    */
    var uint8Value: UInt8 {
        return UInt8(self.cgFloat)
    }

    /**
     CGFloat as a UInt16
    */
    var uint16Value: UInt16 {
        return UInt16(self.cgFloat)
    }

    /**
     CGFloat as a UInt32
    */
    var uint32Value: UInt32 {
        return UInt32(self.cgFloat)
    }

    /**
     CGFloat as a UInt64
    */
    var uint64Value: UInt64 {
        return UInt64(self.cgFloat)
    }

    /**
     CGFloat as a UInt8
    */
    var int8Value: Int8 {
        return Int8(self.cgFloat)
    }

    /**
     CGFloat as a UInt16
    */
    var int16Value: Int16 {
        return Int16(self.cgFloat)
    }

    /**
     CGFloat as a UInt32
    */
    var int32Value: Int32 {
        return Int32(self.cgFloat)
    }

    /**
     CGFloat as a UInt64
    */
    var int64Value: Int64 {
        return Int64(self.cgFloat)
    }

}

public extension CGFloat {

    /**
     RapidCGFloatDSL instance to access custom methods
    */
    var rpd: RapidCGFloatDSL {
        return RapidCGFloatDSL(cgFloat: self)
    }

}


