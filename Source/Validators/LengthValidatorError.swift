//
//  Rapid
//  Copyright (c) 2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 An Enum that represents errors associated with a string's length
*/
public enum LengthValidatorError: Error {

    /**
     An indication that the string is expected to have at least one character, but is contains no character
    */
    case empty

    /**
     An indication that the string is expected to have at least a specified number of characters, but contains less than the
     specified value
    */
    case short(UInt)

    /**
     An indication that the string is expected to have less than a specified number of characters, but contains more than the
     specified value
    */
    case long(UInt)

}
