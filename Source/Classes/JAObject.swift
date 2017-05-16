//
//  JAObject.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//
//

/**
 A subclass of NSObject that implements a print statement when deinitialized
*/
open class JAObject: NSObject {
    deinit {
        print("\(type(of: self)) was deallocated")
    }
}
