//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 A DSL for Sequence to access custom methods
 */
public struct KioSequenceDSL<T: Sequence> {

    // MARK: Stored Propeties
    /**
     Underlying Sequence instance
     */
    public let sequence: T

}

public extension KioSequenceDSL where T.Element: Hashable {

    /**
     Returns an array of Elements but removes duplicates while retaining the order of the different Elements
    */
    var uniques: [T.Element] {
        var seen: Set<T.Element> = []
        return self.sequence.filter({ (element: T.Element) -> Bool in
            switch seen.contains(element) {
                case true:
                    return false

                case false:
                    seen.insert(element)
                    return true
            }
        })

    }

}

public extension Sequence {

    /**
     KioSequenceDSL instance to access custom methods
     */
    var kio: KioSequenceDSL<Self> {
        return KioSequenceDSL(sequence: self)
    }
}
