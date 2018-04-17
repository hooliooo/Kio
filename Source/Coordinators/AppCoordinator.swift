//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

/**
 The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
 the AppDelegate and kick off the start of the application.
*/
open class AppCoordinator<RootViewController: UIViewController>: AbstractCoordinator {

    public init(window: UIWindow, rootViewController: RootViewController) {
        self.window = window
        self.rootViewController = rootViewController
        super.init()
    }

    /**
     The UIWindow instance the AppCoordinator manages. Typically the AppDelegate's UIWindow instance
    */
    public let window: UIWindow

    /**
     The UIWindow instance's rootViewController
    */
    public let rootViewController: RootViewController
}
