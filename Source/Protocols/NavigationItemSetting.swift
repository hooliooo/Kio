//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public protocol NavigationItemSetting: class {

    /**
     Accesses the UIViewController's UINavigationItem instance to manipulate inside a closure.
     - parameter callback: The closure that captures the UINavigationItem instance to be manipulated
    */
    func setUpNavigationItem(_ callback: (UINavigationItem) -> Void)

}

public extension NavigationItemSetting where Self: UIViewController {

    public func setUpNavigationItem(_ callback: (UINavigationItem) -> Void) {
        callback(self.navigationItem)
    }

}
