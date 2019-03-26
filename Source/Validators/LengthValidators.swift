//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 An implementation of Validator that checks if a string is empty or not
*/
public struct EmptyStringInvalidator: Validator {

    // MARK: Intializer
    public init() {}

    // MARK: Stored Properties
    private let error: LengthValidatorError = LengthValidatorError.empty

    public func validate(_ stringValue: String) -> ValidatorResult {
        switch stringValue.isEmpty {
            case true:
                return ValidatorResult.invalid([self.error])

            case false:
                return ValidatorResult.valid
        }
    }

}

/**
 An implementation of Validator that checks if a string is at least a specified number of characters in length
*/
public struct ShortStringInvalidator: Validator {

    // MARK: Intializer
    public init(minimumLength: UInt) {
        self.minimumLength = minimumLength
    }

    // MARK: Stored Properties
    /**
     The minimum length of a string to pass validation
    */
    public let minimumLength: UInt

    private var error: LengthValidatorError {
        return LengthValidatorError.short(self.minimumLength)
    }

    public func validate(_ stringValue: String) -> ValidatorResult {
        switch stringValue.count < self.minimumLength.kio.intValue {
            case true:
                return ValidatorResult.invalid([self.error])

            case false:
                return ValidatorResult.valid
        }
    }

}

/**
 An implementation of Validator that check if a string is less than a specified number of characters in length
 */
public struct LongStringInvalidator: Validator {

    // MARK: Intializer
    public init(maximumLength: UInt) {
        self.maximumLength = maximumLength
    }

    // MARK: Stored Properties
    /**
     The maximum length of a string to pass validation
     */
    public let maximumLength: UInt

    private var error: LengthValidatorError {
        return LengthValidatorError.long(self.maximumLength)
    }

    public func validate(_ stringValue: String) -> ValidatorResult {
        switch stringValue.count > self.maximumLength.kio.intValue {
            case true:
                return ValidatorResult.invalid([self.error])

            case false:
                return ValidatorResult.valid
        }
    }

}
