//
//  AppNetworkActivityIndicatorInjected.swift
//  Kio-iOS
//
//  Created by Julio Miguel Alorro on 3/14/18.
//  Copyright © 2018 Some Enterprises. All rights reserved.
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
