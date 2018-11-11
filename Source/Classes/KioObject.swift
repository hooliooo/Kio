//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class Foundation.NSObject

/**
 A subclass of NSObject that implements a print statement when deinitialized
*/
open class KioObject: NSObject, KioDebuggable {
    deinit {
        self.debugLogMessage()
    }
}

public extension KioDebuggable where Self: NSObject {

    func debugLogMessage() {
        print("\(type(of: self)) was deallocated")
    }

}
