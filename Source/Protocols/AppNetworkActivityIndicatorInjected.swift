//
//  AppNetworkActivityIndicatorInjected.swift
//  Rapid-iOS
//
//  Created by Julio Miguel Alorro on 3/14/18.
//  Copyright © 2018 Some Enterprises. All rights reserved.
//

import UIKit

public protocol AppNetworkActivityIndicatorInjected: class {}

public extension AppNetworkActivityIndicatorInjected {

    var showActivityIndicator: Bool {
        set {
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = newValue
            }
        }

        get { return UIApplication.shared.isNetworkActivityIndicatorVisible }
    }

}
