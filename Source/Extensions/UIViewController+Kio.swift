//
//  UIViewController+Kio.swift
//  Kio-iOS
//
//  Created by Julio Miguel Alorro on 9/14/18.
//  Copyright © 2018 Some Enterprises. All rights reserved.
//

import UIKit

/**
 A DSL for UIViewController to access custom methods
*/
public struct RapidViewControllerDSL {

    // MARK: Stored Propeties
    /**
     Underlying UIViewController instance
     */
    public let viewController: UIViewController

}

public extension RapidViewControllerDSL {

    func add(child childViewController: UIViewController) {
        self.viewController.addChildViewController(childViewController)
        childViewController.didMove(toParentViewController: self.viewController)
        self.viewController.view.addSubview(childViewController.view)
    }

    func remove(child childViewController: UIViewController) {
        guard childViewController.parent === self.viewController else { return }

        childViewController.willMove(toParentViewController: nil)
        childViewController.removeFromParentViewController()
        childViewController.view.removeFromSuperview()
    }

}
