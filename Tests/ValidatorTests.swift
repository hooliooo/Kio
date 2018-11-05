//
//  Kio
//  Copyright (c) 2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import XCTest
@testable import Kio

class ValidatorTests: XCTestCase {

    private func unwrapFirstInvalidResult(_ result: ValidatorResult) -> LengthValidatorError {
        guard
            case .invalid(let errors) = result,
            errors.count == 1,
            let error = errors.first as? LengthValidatorError
        else {
            XCTFail("Error was not LengthValidatorError"); fatalError()
        }

        return error
    }

    private func unwrapInvalidResults(_ result: ValidatorResult) -> [LengthValidatorError] {
        guard
            case .invalid(let errors) = result,
            let lengthErrors = errors as? [LengthValidatorError]
        else {
            XCTFail("Error was not LengthValidatorError"); fatalError()
        }

        return lengthErrors
    }

    // MARK: EmptyStringInvalidator Tests
    func testEmptyStringInvalidatorOnEmptyStringReturnsInvalidResult() {

        let result: ValidatorResult = EmptyStringInvalidator().validate("")

        XCTAssertTrue(
            result == ValidatorResult.invalid([]),
            "Should equate to true"
        )

        let error: LengthValidatorError = self.unwrapFirstInvalidResult(result)
        XCTAssertTrue(error == LengthValidatorError.empty)

    }

    func testEmptyStringInvalidatorOnStringReturnsValidResult() {

        let result: ValidatorResult = EmptyStringInvalidator().validate("Has characters in string")
        XCTAssertTrue(result == ValidatorResult.valid)

    }

    // MARK: ShortStringInvalidator Tests
    func testShortStringInvalidatorOnShortStringReturnsInvalidResult() {

        let result: ValidatorResult = ShortStringInvalidator(minimumLength: 8).validate("Short")

        XCTAssertTrue(
            result == ValidatorResult.invalid([]),
            "Should equate to true"
        )

        let error: LengthValidatorError = self.unwrapFirstInvalidResult(result)
        XCTAssertTrue(error == LengthValidatorError.short(8))

    }

    func testShortStringInvalidatorOnLongStringReturnsValidResult() {
        let result: ValidatorResult = ShortStringInvalidator(minimumLength: 8).validate("This is short")
        XCTAssertTrue(result == ValidatorResult.valid)
    }

    // MARK: LongStringInvalidator Tests
    func testLongStringInvalidatorOnLongStringReturnsInvalidResult() {
        let result: ValidatorResult = LongStringInvalidator(maximumLength: 4).validate("Long string this that")

        XCTAssertTrue(
            result == ValidatorResult.invalid([]),
            "Should equate to true"
        )

        let error: LengthValidatorError = self.unwrapFirstInvalidResult(result)
        XCTAssertTrue(error == LengthValidatorError.long(4))
    }

    // MARK: CompositeValidator Tests
    func testAndCompositeValidator() {
        let sampleText: String = ""

        let validator: AndCompositeValidator = AndCompositeValidator(
            validators: EmptyStringInvalidator(), ShortStringInvalidator(minimumLength: 8)
        )

        let result: ValidatorResult = validator.validate(sampleText)
        let errors: [LengthValidatorError] = self.unwrapInvalidResults(result)

        XCTAssertFalse(errors.contains(LengthValidatorError.empty))
        XCTAssertTrue(errors.contains(LengthValidatorError.short(8)))
        XCTAssertTrue(errors.count == 1)
    }

}
