//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

public protocol TargetActionSetting: class {
    /**
     Convenience method that assigns a selector method to a UIControl instance
     - parameter dict: The dictionary containing the UIControl and Selector pairing
    */
    func setUpTargetActions(with dict: [UIControl: Selector])
}

public extension TargetActionSetting where Self: UIViewController {

    public func setUpTargetActions(with dict: [UIControl: Selector]) {

        for (control, action) in dict {

            let controlEvent: UIControlEvents

            switch control {

                case is UISegmentedControl, is UIDatePicker, is UIRefreshControl, is UISwitch:
                    controlEvent = UIControlEvents.valueChanged

                default:
                    controlEvent = UIControlEvents.touchUpInside
            }

            control.addTarget(self, action: action, for: controlEvent)
        }
    }
}
