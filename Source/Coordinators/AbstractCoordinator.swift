//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 The AbstractCoordinator is an abstract class instantiates and defines all the variables and methods that are common in all
 of its subclasses. Not intended to be instantiated directly.
*/
open class AbstractCoordinator: JAObject, Coordinator {
    override init() {
        guard type(of: self) != AbstractCoordinator.self else {
            fatalError(
                "AbstractCoordinator instances cannot be created. Use subclasses instead"
            )
        }
        super.init()
    }

    // MARK: Stored Properties
    /**
     Instance variable of an array of childCoordinators
    */
    private var _childCoordinators: [Coordinator] = []

    // MARK: Computed Properties
    public var childCoordinators: [Coordinator] {
        return self._childCoordinators
    }

    // MARK: Instance Methods
    public func start() {
        fatalError("Must override, do not call super.start() in your subclasses!")
    }

    public func add(childCoordinator coordinator: Coordinator) {
        self._childCoordinators.append(coordinator)
    }

    public func remove(childCoordinator coordinator: Coordinator) {
        self._childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
    }
}
