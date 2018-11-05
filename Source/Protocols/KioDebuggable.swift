//
//  KioDebuggable.swift
//  Kio
//
//  Created by Julio Miguel Alorro on 10/25/18.
//  Copyright © 2018 Some Enterprises. All rights reserved.
//

import Foundation

public protocol KioDebuggable: class {

    /**
     Debug messgae printed on the console
    */
    func debugLogMessage()
}

public extension KioDebuggable where Self: UIViewController {

    func debugLogMessage() {
        print("\(type(of: self)) was deallocated")
    }

}

public extension KioDebuggable where Self: UIView {

    func debugLogMessage() {
        print("\(type(of: self)) was deallocated")
    }

}

public extension KioDebuggable where Self: NSObject {

    func debugLogMessage() {
        print("\(type(of: self)) was deallocated")
    }

}
