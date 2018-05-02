//
//  KioTests.swift
//  KioTests
//
//  Created by Julio Alorro on 5/14/17.
//  Copyright (c) 2017 Some Enterprises. All rights reserved.
//

import XCTest
import Rapid

class RapidTests: XCTestCase {

    override func setUp() {
        super.setUp()

        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {

        let string: String = ""

        let validator: OrCompositeValidator = OrCompositeValidator(
            validators: EmptyStringValidator(), LongStringValidator(maximumLength: 2)
        )

        print(validator.validate(string))

        XCTAssert(validator.validate(string) == ValidatorResult.valid)

        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
