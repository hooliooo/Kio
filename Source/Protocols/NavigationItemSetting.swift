//
//  NavigationItemSetting.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
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
