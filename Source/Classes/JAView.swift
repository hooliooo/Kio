//
//  JAView.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import UIKit

/**
 A subclass of UIView that implements a print statement when deinitialized
*/
open class JAView: UIView {
    deinit {
        print("\(self) was deallocated")
    }
}
