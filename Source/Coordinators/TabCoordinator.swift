//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

public protocol TabCoordinator: Coordinator {

    associatedtype ViewController: UIViewController

    var viewController: ViewController { get }

    var tabBarItem: UITabBarItem { get }

}
