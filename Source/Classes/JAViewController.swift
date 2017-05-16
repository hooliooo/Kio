//
//  JAViewController.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//
//

/**
 A subclass of UIViewController that implements a print statement when deinitialized. 
 Conforms to NavigationItemSetting and TargetActionSetting.
*/
open class JAViewController: UIViewController, NavigationItemSetting, TargetActionSetting {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
