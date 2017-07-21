//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

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

                case is UISegmentedControl, is UIDatePicker, is UIRefreshControl:
                    controlEvent = UIControlEvents.valueChanged

                default:
                    controlEvent = UIControlEvents.touchUpInside
            }

            control.addTarget(self, action: action, for: controlEvent)
        }
    }
}
