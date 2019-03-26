//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class UIKit.UIView
import class UIKit.UIViewController
import class UIKit.UIActivityIndicatorView
import class UIKit.UINavigationItem
import class UIKit.UIControl
import class UIKit.UISegmentedControl
import class UIKit.UIDatePicker
import class UIKit.UIRefreshControl
import class UIKit.UISwitch
import struct UIKit.Selector
import class UIKit.NSLayoutConstraint
import struct CoreGraphics.CGSize
import class Foundation.DispatchQueue

/**
 A DSL for UIViewController to access custom methods
*/
public struct KioViewControllerDSL {

    // MARK: Stored Propeties
    /**
     Underlying UIViewController instance
     */
    public let viewController: UIViewController

}

public extension KioViewControllerDSL {

    func add(child childViewController: UIViewController) {
        self.viewController.addChild(childViewController)
        childViewController.didMove(toParent: self.viewController)
        self.viewController.view.addSubview(childViewController.view)
    }

    func remove(child childViewController: UIViewController) {
        guard childViewController.parent === self.viewController else { return }

        childViewController.willMove(toParent: nil)
        childViewController.removeFromParent()
        childViewController.view.removeFromSuperview()
    }

    /**
     Accesses the UIViewController's UINavigationItem instance to manipulate inside a closure.
     - parameter callback: The closure that captures the UINavigationItem instance to be manipulated
     */
    func setUpNavigationItem(_ callback: (UINavigationItem) -> Void) {
        callback(self.viewController.navigationItem)
    }

    /**
     Convenience method that assigns a selector method to a UIControl instance
     - parameter dict: The dictionary containing the UIControl and Selector pairing
     */
    func setUpTargetActions(with dict: [UIControl: Selector]) {

        for (control, action) in dict {

            let controlEvent: UIControl.Event

            switch control {
                case is UISegmentedControl, is UIDatePicker, is UIRefreshControl, is UISwitch:
                    controlEvent = UIControl.Event.valueChanged

                default:
                    controlEvent = UIControl.Event.touchUpInside
            }

            control.addTarget(self.viewController, action: action, for: controlEvent)
        }
    }

    private func createActivityIndicator(with size: CGSize) -> KioActivityIndicatorView {
        let view: KioActivityIndicatorView = KioActivityIndicatorView()
        view.style = UIActivityIndicatorView.Style.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.hidesWhenStopped = true
        view.kio.cornerRadius(of: 5.0)

        self.viewController.view.addSubview(view)
        NSLayoutConstraint.activate([
            view.centerXAnchor.constraint(equalTo: self.viewController.view.centerXAnchor),
            view.centerYAnchor.constraint(equalTo: self.viewController.view.centerYAnchor),
            view.heightAnchor.constraint(equalToConstant: size.height),
            view.widthAnchor.constraint(equalToConstant: size.width)
        ])
        return view
    }

    private func findActivityIndicator() -> KioActivityIndicatorView? {
        return self.viewController.view.subviews.reversed()
            .first(where: { (view: UIView) -> Bool in view is KioActivityIndicatorView}) as? KioActivityIndicatorView
    }

    func showActivityIndicator(with size: CGSize = CGSize(width: 60.0, height: 60.0)) {
        DispatchQueue.main.async { () -> Void in
            self.createActivityIndicator(with: size)
                .startAnimating()

            self.viewController.view.isUserInteractionEnabled = false
        }
    }

    func hideActivityIndicator() {
        DispatchQueue.main.async { () -> Void in
            guard let view = self.findActivityIndicator() else { return }

            view.stopAnimating()
            view.removeFromSuperview()
            self.viewController.view.isUserInteractionEnabled = true
        }
    }

}

public extension UIViewController {
    /**
     KioViewControllerDSL instance to access custom methods
    */
    var kio: KioViewControllerDSL {
        return KioViewControllerDSL(viewController: self)
    }
}
