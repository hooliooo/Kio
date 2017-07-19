//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
 the AppDelegate and kick off the start of the application.
*/
public class AppCoordinator<RootViewController: UIViewController>: AbstractCoordinator {

    init(window: UIWindow, rootViewController: RootViewController) {
        self.window = window
        self.rootViewController = rootViewController
        super.init()
    }

    /**
     The UIWindow instance the AppCoordinator manages. Typically the AppDelegate's UIWindow instance
    */
    let window: UIWindow

    /**
     The UIWindow instance's rootViewController
    */
    let rootViewController: RootViewController
}
