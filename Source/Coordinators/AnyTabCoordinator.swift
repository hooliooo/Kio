//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

public class AnyTabCoordinator {

    // MARK: Initializer
    init<T: TabCoordinator>(_ tabCoordinator: T) {
        self.viewController = tabCoordinator.viewController
        self.tabBarItem = tabCoordinator.tabBarItem
    }

    // MARK: Stored Properties
    /**
     UIViewController instance being managed
     */
    let viewController: UIViewController

    /**
     UITabBarItem for the UIViewController
     */
    let tabBarItem: UITabBarItem
}
