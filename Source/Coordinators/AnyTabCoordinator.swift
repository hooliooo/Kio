//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

open class AnyTabCoordinator {

    // MARK: Initializer
    public init<T: TabCoordinator>(_ tabCoordinator: T) {
        self.viewController = tabCoordinator.viewController
        self.tabBarItem = tabCoordinator.tabBarItem
    }

    // MARK: Stored Properties
    /**
     UIViewController instance being managed
     */
    open let viewController: UIViewController

    /**
     UITabBarItem for the UIViewController
     */
    open let tabBarItem: UITabBarItem
}
