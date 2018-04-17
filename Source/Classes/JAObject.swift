//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 A subclass of NSObject that implements a print statement when deinitialized
*/
open class JAObject: NSObject {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
