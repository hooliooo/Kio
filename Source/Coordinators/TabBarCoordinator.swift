//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

public protocol TabBarCoordinator: Coordinator {

    /**
     Array of TabCoordinators managed by the TabBarCoordinator
    */
    var tabs: [AnyTabCoordinator] { get set }

    /**
     Type erasing method for TabCoordinator
    */
    func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator
}

public extension TabBarCoordinator {

    public func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator {
        return AnyTabCoordinator(coordinator)
    }
}
