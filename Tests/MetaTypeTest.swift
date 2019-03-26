//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import XCTest
@testable import Kio

class MetaTypeTest: XCTestCase {

    func testHashValueWorks() {

        var dict: [MetaType<Coordinator>: Int] = [
            MetaType(Coordinator.self): 5
        ]

        dict[MetaType(Coordinator.self)] = 10

        XCTAssert(dict[MetaType(Coordinator.self)] == 10)
    }
}
