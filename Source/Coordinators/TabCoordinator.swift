//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class UIKit.UIViewController
import class UIKit.UITabBarItem

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
