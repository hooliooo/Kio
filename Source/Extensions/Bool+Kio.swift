//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 A DSL for Bool to access custom methods
 */
public struct KioBoolDSL {

    // MARK: Stored Propeties
    /**
     Underlying Bool instance
     */
    public let bool: Bool

}

public extension KioBoolDSL {

    /**
     Bool is true
     */
    var isTrue: Bool {
        return self.bool == true
    }

    /**
     Bool is false
     */
    var isFalse: Bool {
        return self.bool == false
    }
}

public extension Bool {

    /**
     KioIntDSL instance to access custom methods
     */
    var kio: KioBoolDSL {
        return KioBoolDSL(bool: self)
    }
}
