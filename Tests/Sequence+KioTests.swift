//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import XCTest
@testable import Kio

typealias StringTuple = (String, String)

class SequenceDSLTests: XCTestCase {

    func testUniqued() {

        let strings: [String] = ["A", "B", "C", "C", "B", "D", "C", "E", "E"]
        let uniquedStrings: [String] = strings.kio.uniqued

        XCTAssertTrue(uniquedStrings == ["A", "B", "C", "D", "E"])
    }

    func testPaired() {

        let strings: [String] = ["A", "B", "C", "D", "E"]
        let pairedStrings: [(first: String, second: String)] = strings.kio.paired

        XCTAssertTrue(pairedStrings[0].first == "A")
        XCTAssertTrue(pairedStrings[0].second == "B")

        XCTAssertTrue(pairedStrings[1].first == "B")
        XCTAssertTrue(pairedStrings[1].second == "C")

        XCTAssertTrue(pairedStrings[2].first == "C")
        XCTAssertTrue(pairedStrings[2].second == "D")

        XCTAssertTrue(pairedStrings[3].first == "D")
        XCTAssertTrue(pairedStrings[3].second == "E")

    }

}
