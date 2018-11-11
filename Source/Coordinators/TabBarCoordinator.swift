//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A TabBarCoordinator is a type of Coordinator that manages a UITabBarController.
*/
public protocol TabBarCoordinator: Coordinator {

    /**
     Array of TabCoordinators managed by the TabBarCoordinator
    */
    var tabs: [AnyTabCoordinator] { get set }

    /**
     Type erasing method for TabCoordinator
     - parameter coordinator: The TabCoordinator instance to be type erased.
    */
    func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator

    /**
     Type erasing method for an array of TabCoordinators
     - parameter coordinators: The TabCoordinator instances to be type erased.
    */
    func degenericize<T: TabCoordinator>(_ coordinators: [T]) -> [AnyTabCoordinator]
}

public extension TabBarCoordinator {

    func degenericize<T: TabCoordinator>(_ coordinator: T) -> AnyTabCoordinator {
        return AnyTabCoordinator(coordinator)
    }

    func degenericize<T: TabCoordinator>(_ coordinators: [T]) -> [AnyTabCoordinator] {
        return coordinators.map(AnyTabCoordinator.init)
    }
}
