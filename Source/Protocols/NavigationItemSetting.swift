//
//  NavigationItemSetting.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import UIKit

public protocol NavigationItemSetting {

    func setUpNavigationItem(_ completionHandler: (UINavigationItem) -> Void)

}

public extension NavigationItemSetting where Self: UIViewController {

    public func setUpNavigationItem(_ completionHandler: (UINavigationItem) -> Void) {
        completionHandler(self.navigationItem)
    }
    
}
