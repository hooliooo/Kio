//
//  Kio
//  Copyright (c) 2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 A Validator is an object that evaluates a String instance and returns a ValidatorResult based on some condition(s)
*/
public protocol Validator {

    /**
     Evaluate a String instace. Returns a ValidatorResult.
     - parameter stringValue: The String instance being evaluated.
    */
    func validate(_ stringValue: String) -> ValidatorResult

}
