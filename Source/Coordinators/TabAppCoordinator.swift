//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

open class TabAppCoordinator: AppCoordinator<UITabBarController> {

    // MARK: Initializer
    public override init(window: UIWindow, rootViewController: UITabBarController) {
        super.init(window: window, rootViewController: rootViewController)
    }

    // MARK: Stored Properties
    var tabs: [AnyTabCoordinator] = []

    // MARK: Instance Methods
    public func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator {
        return AnyTabCoordinator(coordinator)
    }
}
