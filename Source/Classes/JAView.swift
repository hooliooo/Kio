//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

/**
 A subclass of UIView that implements a print statement when deinitialized
*/
open class JAView: UIView {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
