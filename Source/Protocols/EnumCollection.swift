//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 EnumCollection is used on String Enums to return all the cases of that enum as an array
*/
public protocol EnumCollection: Hashable {}

public extension EnumCollection {

    /**
     Returns an array of all the enum cases
    */
    static func cases() -> [Self] {
        typealias Case = Self

        let sequence: AnySequence<Self> = AnySequence { () -> AnyIterator<Case> in
            var raw: Int = 0

            return AnyIterator {
                let current: Self = withUnsafeMutablePointer(to: &raw) { (pointer: UnsafeMutablePointer<Int>) -> Self in
                    pointer.withMemoryRebound(to: Case.self, capacity: 1) { (otherPointer: UnsafeMutablePointer<Self>) -> Self in
                        return otherPointer.pointee
                    }
                }
                guard current.hashValue == raw else { return nil }

                raw += 1
                return current
            }
        }

        return Array(sequence)
    }

}
