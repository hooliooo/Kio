//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class UIKit.UIActivityIndicatorView

/**
 A subclass of UIActivityIndicatorView that implements a print statement when deinitialized
*/
open class KioActivityIndicatorView: UIActivityIndicatorView, KioDebuggable {
    deinit {
        self.debugLogMessage()
    }
}
