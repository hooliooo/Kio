//
//  Rapid
//  Copyright (c) 2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 An AndCompositeValidator is a Validator that composes a ValidatorResult based on other Validators it is initlialized with.
 Its validate(_:) method will only return a .valid ValidatorResult if all of its Validators all return a .valid ValidatorResult
*/
public struct AndCompositeValidator: Validator {

    // MARK: Intializer
    /**
     Initializer to create an AndCompositeValidator instance
     - parameter validatiors: Validators to compose a ValidatorResult with
    */
    public init(validators: Validator...) {
        self.validators = validators
    }

    // MARK: Storedd Properties
    private let validators: [Validator]

    // MARK: Instance Methods
    public func validate(_ stringValue: String) -> ValidatorResult {
        return self.validators.reduce(into: .valid) { (validatorResult: inout ValidatorResult, validator: Validator) -> Void in
            switch validator.validate(stringValue) {
                case .valid:
                    break

                case .invalid(let validatorErrors):
                    switch validatorResult {
                        case .valid:
                            validatorResult = .invalid(validatorErrors)
                        case .invalid(let validatorResultErrors):
                            validatorResult = .invalid( validatorResultErrors + validatorErrors)
                    }
            }
        }
    }
}

/**
 An OrCompositeValidator is a Validator that composes a ValidatorResult based on other Validators it is initlialized with.
 Its validate(_:) method will return a .valid ValidatorResult if at least one of its Validators returns a .valid ValidatorResult
*/
public struct OrCompositeValidator: Validator {

    // MARK: Intializer
    /**
     Initializer to create an OrCompositeValidator instance
     - parameter validatiors: Validators to compose a ValidatorResult with
    */
    public init(validators: Validator...) {
        self.validators = validators
    }

    // MARK: Storedd Properties
    private let validators: [Validator]

    // MARK: Instance Methods
    public func validate(_ stringValue: String) -> ValidatorResult {

        var errors: [Swift.Error] = []

        for validator in self.validators {
            switch validator.validate(stringValue) {
                case .valid:
                    return ValidatorResult.valid

                case .invalid(let newErrors):
                    errors.append(contentsOf: newErrors)
            }
        }

        return ValidatorResult.invalid(errors)

    }
}
