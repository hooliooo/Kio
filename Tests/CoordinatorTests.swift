//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import XCTest
@testable import Kio

class CoordinatorTests: XCTestCase {

    func testStartMethod() {
        let coordinator: CoordinatorA = CoordinatorA()
        coordinator.start()

        XCTAssert(coordinator.hasStarted)
    }

    func testAddCAndRemovehildCoordinator() {
        let coordinatorA: CoordinatorA = CoordinatorA()
        let coordinatorB: CoordinatorB = CoordinatorB()

        coordinatorA.add(childCoordinator: coordinatorB)
        XCTAssert(coordinatorA.childCoordinators.contains(where: { $0 === coordinatorB }))
        XCTAssert(coordinatorA.childCoordinators.count == 1)

        coordinatorA.remove(childCoordinator: coordinatorB)

        XCTAssert(coordinatorA.childCoordinators.contains(where: { $0 === coordinatorB }) == false)
        XCTAssert(coordinatorA.childCoordinators.isEmpty)
    }

}

fileprivate class CoordinatorA: AbstractCoordinator {} // swiftlint:disable:this private_over_fileprivate
fileprivate class CoordinatorB: AbstractCoordinator {} // swiftlint:disable:this private_over_fileprivate
