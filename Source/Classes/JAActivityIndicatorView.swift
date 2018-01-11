//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A subclass of UIActivityIndicatorView that implements a print statement when deinitialized
*/
open class JAActivityIndicatorView: UIActivityIndicatorView {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
