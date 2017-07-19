//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public protocol NavigationItemSetting {

    /**
     Accesses the UIViewController's UINavigationItem instance to manipulate inside a closure.
    */
    func setUpNavigationItem(_ completionHandler: (UINavigationItem) -> Void)

}

public extension NavigationItemSetting where Self: UIViewController {

    public func setUpNavigationItem(_ completionHandler: (UINavigationItem) -> Void) {
        completionHandler(self.navigationItem)
    }

}
