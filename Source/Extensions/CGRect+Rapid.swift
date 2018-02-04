//
//  CGRect+Rapid.swift
//  Rapid
//
//  Created by Julio Alorro on 2/4/18.
//  Copyright © 2018 Some Enterprises. All rights reserved.
//

import Foundation

/**
 A DSL for CGRect to access custom methods
 */
public struct RapidCGRectDSL {

    // MARK: Stored Propeties
    /**
     Underlying CGRect instance
     */
    public let rect: CGRect

}

public extension RapidCGRectDSL {

    /**
     The coordinate of the left bottom point of the CGRect
    */
    var bottomLeftPoint: CGPoint {
        return CGPoint(x: self.rect.origin.x, y: self.rect.maxY)
    }

    /**
     The coordinate of the right bottom point of the CGRect
    */
    var bottomRightPoint: CGPoint {
        return CGPoint(x: self.rect.maxX, y: self.rect.maxY)
    }

    /**
     The coordinate of the right top point of the CGRect
    */
    var topRightPoint: CGPoint {
        return CGPoint(x: self.rect.maxX, y: self.rect.origin.y)
    }

    /**
     The x coordinate of the left side of the CGRect, aka CGRect.origin.x.
    */
    var left: CGFloat {
        return self.rect.origin.x
    }

    /**
     The x coordinate of the right side of the CGRect, aka CGRect.maxX.
    */
    var right: CGFloat {
        return self.rect.maxX
    }

    /**
     The y coordinate of the top side of the CGRect, aka CGRect.origin.y
    */
    var top: CGFloat {
        return self.rect.origin.y
    }

    /**
     The y coordinate of the bottom side of the CGRect, aka CGRect.maxY
    */
    var bottom: CGFloat {
        return self.rect.maxY
    }

    /**
     The center of the CGRect, aka CGRect.midX, CGRect.midY
    */
    var center: CGPoint {
        return CGPoint(x: self.rect.midX, y: self.rect.midY)
    }

    /**
     The centerX of the CGRect, aka CGRect.midX
    */
    var centerX: CGFloat {
        return self.rect.midX
    }

    /**
     The centerY of the CGRect, aka CGRect.midX, CGRect.midY
    */
    var centerY: CGFloat {
        return self.rect.midY
    }

}

public extension CGRect {

    /**
     RapidCGRectDSL instance to access custom methods
     */
    var rpd: RapidCGRectDSL {
        return RapidCGRectDSL(rect: self)
    }
}
