//
//  JAObject.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import Foundation

/**
 A subclass of NSObject that implements a print statement when deinitialized
*/
public class JAObject: NSObject {
    deinit {
        print("\(self) was deallocated")
    }
}
