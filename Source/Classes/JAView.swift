//
//  JAView.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//
//

/**
 A subclass of UIView that implements a print statement when deinitialized
*/
open class JAView: UIView {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
