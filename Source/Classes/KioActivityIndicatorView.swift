//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

/**
 A subclass of UIActivityIndicatorView that implements a print statement when deinitialized
*/
open class KioActivityIndicatorView: UIActivityIndicatorView, KioDebuggable {
    deinit {
        self.debugLogMessage()
    }
}
