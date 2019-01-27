//
//  MetaTypeTest.swift
//  Tests
//
//  Created by Julio Miguel Alorro on 1/27/19.
//  Copyright © 2019 Some Enterprises. All rights reserved.
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
