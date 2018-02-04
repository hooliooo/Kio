//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A DSL for UIView to access custom methods
*/
public struct RapidViewDSL {

    // MARK: Stored Propeties
    /**
     Underlying UIView instance
    */
    public let view: UIView

}

public extension RapidViewDSL {

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
     specific value and sets clipsToBounds property to true.

     - parameter value: The value used to set the UIView's cornerRadius.
    */
    func cornerRadius(of value: CGFloat) {
        self.view.layer.cornerRadius = value
        self.view.clipsToBounds = true
    }

}

public extension UIView {
    /**
     RapidViewDSL instance to access custom methods
    */
    var rpd: RapidViewDSL {
        return RapidViewDSL(view: self)
    }
}
