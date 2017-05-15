//
//  AnyCoordinator.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/15/17.
//  Copyright © 2017 Some Enterprises. All rights reserved.
//

import UIKit

public final class AnyCoordinator {

    public var rootViewController: UIViewController

    public init<Type: Coordinator>(_ coordinator: Type) {
        self.rootViewController = coordinator.viewController
    }

}
