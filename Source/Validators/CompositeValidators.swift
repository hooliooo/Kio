//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 An AndCompositeValidator is a Validator that composes a ValidatorResult based on other Validators it is initlialized with.
 Its validate(_:) method will only return a .valid ValidatorResult if all of its Validators return a .valid ValidatorResult
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

    // MARK: Stored Properties
    private let validators: [Validator]

    // MARK: Instance Methods
    public func validate(_ stringValue: String) -> ValidatorResult { // swiftlint:disable:next line_length
        return self.validators.reduce(into: ValidatorResult.valid) { (result: inout ValidatorResult, validator: Validator) -> Void in
            switch validator.validate(stringValue) {
                case .valid:
                    break

                case .invalid(let currentErrors):
                    switch result {
                        case .valid:
                            result = .invalid(currentErrors)

                        case .invalid(let newErrors):
                            result = .invalid(currentErrors + newErrors)
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

    // MARK: Stored Properties
    private let validators: [Validator]

    // MARK: Instance Methods
    public func validate(_ stringValue: String) -> ValidatorResult {

        var currentErrors: [Swift.Error] = []

        for validator in self.validators {
            switch validator.validate(stringValue) {
                case .valid:
                    return ValidatorResult.valid

                case .invalid(let newErrors):
                    currentErrors.append(contentsOf: newErrors)
            }
        }

        return ValidatorResult.invalid(currentErrors)

    }
}
