//
//  UIViewExtensions.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//
//

import UIKit

public extension UIView {

    /**
     Adds subview and sets translatesAutoresizingMaskIntoConstraints to false.

     - parameter subview: The subview to add and prepare for AutoLayout.
     */
    public func subview(forAutoLayout subview: UIView) {
        self.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }

    /**
     Variadic version of subview(forAutoLayout subview:) method.

     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.

     - parameter subviews: The subviews to add and prepare for AutoLayout.
     */
    public func subviews(forAutoLayout subviews: UIView...) {
        self.subviews(forAutoLayout: subviews)
    }

    /**
     Array version of subview(forAutoLayout subview:) method.

     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.

     - parameter subviews: The subviews to add and prepare for AutoLayout.
     */
    public func subviews(forAutoLayout subviews: [UIView]) {
        subviews.forEach { [unowned self] (subview: UIView) -> Void in
            self.subview(forAutoLayout: subview)
        }
    }

    /**
     Helper function that sets the UIView's cornerRadius to a
     specific value and sets clipsToBounds property to true.

     - parameter value: The value used to set the UIView's cornerRadius.
     */
    public func cornerRadius(of value: CGFloat) {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }

}
