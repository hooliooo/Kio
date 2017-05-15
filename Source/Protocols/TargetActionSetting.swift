//
//  TargetActionSetting.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//  
//

import UIKit

public protocol TargetActionSetting: class {
    func setUpTargetActions(with dict: [UIControl: Selector])
}

public extension TargetActionSetting where Self: UIViewController {

    public func setUpTargetActions(with dict: [UIControl: Selector]) {

        for (control, action) in dict {

            let controlEvent: UIControlEvents

            switch control {

                case is UISegmentedControl, is UIDatePicker, is UIRefreshControl:
                    controlEvent = UIControlEvents.valueChanged

                default:
                    controlEvent = UIControlEvents.touchUpInside
            }

            control.addTarget(self, action: action, for: controlEvent)
        }
    }
}
