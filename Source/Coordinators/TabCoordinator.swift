//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

public protocol TabCoordinator: Coordinator {

    /**
     UIViewController type to be managed by TabCoordinator
    */
    associatedtype ViewController: UIViewController

    /**
     UIViewController instance being managed
    */
    var viewController: ViewController { get }

    /**
     UITabBarItem for the UIViewController
    */
    var tabBarItem: UITabBarItem { get }

}
