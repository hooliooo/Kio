//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class UIKit.UIView

/**
 A subclass of UIView that implements a print statement when deinitialized
*/
open class KioView: UIView, KioDebuggable {
    deinit {
        self.debugLogMessage()
    }
}

public extension KioDebuggable where Self: UIView {

    func debugLogMessage() {
        print("\(type(of: self)) was deallocated")
    }

}
