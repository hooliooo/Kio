//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import class UIKit.UIView
import struct CoreGraphics.CGFloat

/**
 A DSL for UIView to access custom methods
*/
public struct KioViewDSL {

    // MARK: Stored Propeties
    /**
     Underlying UIView instance
    */
    public let view: UIView

}

public extension KioViewDSL {

    /**
     Adds subview and sets translatesAutoresizingMaskIntoConstraints to false.

     - parameter subview: The subview to add and prepare for AutoLayout.
    */
    func subview(forAutoLayout subview: UIView) {
        self.view.addSubview(subview)
        subview.translatesAutoresizingMaskIntoConstraints = false
    }

    /**
     Variadic version of subview(forAutoLayout subview:) method.

     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.

     - parameter subviews: The subviews to add and prepare for AutoLayout.
    */
    func subviews(forAutoLayout subviews: UIView...) {
        self.subviews(forAutoLayout: subviews)
    }

    /**
     Array version of subview(forAutoLayout subview:) method.

     Adds subviews and sets translatesAutoresizingMaskIntoConstraints to false.

     - parameter subviews: The subviews to add and prepare for AutoLayout.
    */
    func subviews(forAutoLayout subviews: [UIView]) {
        subviews.forEach(self.subview)
    }

    /**
     Helper function that sets the UIView's cornerRadius to a
     specific value and sets that UIView's layer to the same backgroundColor

     More performant than setting maskToBounds to true when dealing with many subviews
     with rounded corners such as UICollectionView/UITableView oriented screens

     - parameter value: The value used to set the UIView's cornerRadius.
    */
    func cornerRadius(of value: CGFloat) {
        self.view.layer.cornerRadius = value
        self.view.layer.backgroundColor = self.view.backgroundColor?.cgColor
    }

}

public extension UIView {
    /**
     KioViewDSL instance to access custom methods
    */
    var kio: KioViewDSL {
        return KioViewDSL(view: self)
    }
}
