//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class UIKit.UIWindow
import class UIKit.UIViewController

/**
 The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
 the AppDelegate, kick off the start of the application, and set up any configurations for the entire application.
*/
open class AppCoordinator<RootViewController: UIViewController>: AbstractCoordinator {

    /**
     The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
     the AppDelegate, kick off the start of the application, and set up any configurations for the entire application.
     - parameter window: The UIWindow instance managed by the AppCoordinator. Taken from the AppDelegate.
     - parameter rootViewController: The UIViewController instance that is the rootViewController of the UIWindow.
    */
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
