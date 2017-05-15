//
//  JAViewController.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import UIKit

/**
 A subclass of UIViewController that implements a print statement when deinitialized. 
 Conforms to NavigationItemSetting and TargetActionSetting.
*/
public class JAViewController: UIViewController, NavigationItemSetting, TargetActionSetting {
    deinit {
        print("\(self) was deallocated")
    }
}
