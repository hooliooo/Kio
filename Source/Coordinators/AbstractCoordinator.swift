//
//  AbstractCoordinator.swift
//  Rapid
//
//  Created by Julio Alorro on 7/19/17.
//  Copyright © 2017 Some Enterprises. All rights reserved.
//

import Foundation

public class AbstractCoordinator: Coordinator {
    init() {
        guard type(of: self) != AbstractCoordinator.self else {
            fatalError(
                "AbstractCoordinator instances cannot be created. Use subclasses instead"
            )
        }
    }

    // MARK: Stored Properties
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
