//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class Foundation.DispatchQueue
import class UIKit.UIApplication

public protocol AppNetworkActivityIndicatorInjected: class {}

public extension AppNetworkActivityIndicatorInjected {

    var showActivityIndicator: Bool {
        set {
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
            }
        }

        get {
            return UIApplication.shared.isNetworkActivityIndicatorVisible
        }
    }

}
