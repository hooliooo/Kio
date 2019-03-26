//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import XCTest
@testable import Kio

class ArrayProviderTests: XCTestCase {

    private var provider: ArrayProvider<String>!

    override func setUp() {
        super.setUp()

        self.provider = ArrayProvider<String>(elements: [
            "Hamburger", "Pizza", "Wurstsalat", "Bolognese", "Müsli", "Barbecue"
        ])
    }

    override func tearDown() {
        super.tearDown()
        self.provider.removeAll()
    }

    func testElementsArray() {
        XCTAssert(self.provider.elements == ["Hamburger", "Pizza", "Wurstsalat", "Bolognese", "Müsli", "Barbecue"])
    }

    func testNumberOfItemsAndNumberOfSections() {
        XCTAssert(self.provider.numberOfSections() == 1)
        XCTAssert(self.provider.numberOfItems(in: 0) == self.provider.elements.count)
    }

    func testElementAtIndexPath() {
        let firstElementIndex: Int = self.provider.elements.startIndex

        XCTAssert(self.provider.element(at: IndexPath(item: firstElementIndex, section: 0)) == "Hamburger")

        let secondElementIndex: Int = self.provider.elements.index(after: firstElementIndex)
        guard let secondElement = self.provider.element(at: IndexPath(item: secondElementIndex, section: 0))
            else { XCTFail("Second element not found"); return }

        XCTAssert(secondElement == "Pizza")

        let lastElementIndex: Int = self.provider.elements.index(before: self.provider.elements.endIndex)
        guard let lastElement = self.provider.element(at: IndexPath(item: lastElementIndex, section: 0))
            else { XCTFail("Last element not found"); return }

        XCTAssert(lastElement == "Barbecue")
    }

    func testAddElement() {
        let currentCount: Int = self.provider.elements.count
        let twix: String = "Twix"

        self.provider.add(element: twix)
        XCTAssert(self.provider.elements.contains(twix))
        XCTAssert(self.provider.elements.count == currentCount + 1)
    }

    func testAddElements() {
        let currentCount: Int = self.provider.elements.count
        let twix: String = "Twix"
        let snickers: String = "Snickers"

        self.provider.add(elements: [twix, snickers])
        XCTAssert(self.provider.elements.contains(twix) && self.provider.elements.contains(snickers))
        XCTAssert(self.provider.elements.count == currentCount + 2)
    }

    func testRemoveElementAtIndexPath() {
        let currentCount: Int = self.provider.elements.count

        guard let hamburger = self.provider.remove(element: "Hamburger", at: IndexPath(item: 0, section: 0))
            else { XCTFail("Hamburger isn't in the array or at the specified IndexPath"); return }

        XCTAssert(self.provider.elements.count == currentCount - 1)
        XCTAssert(self.provider.elements.contains(hamburger) == false)
    }

    func testRemoveElementsAtIndexPaths() {
        let currentCount: Int = self.provider.elements.count

        let tuples: [(food: String, indexPath: IndexPath)] = self.provider.remove(
            elements: ["Hamburger", "Müsli", "Barbecue"],
            at: [IndexPath(item: 0, section: 0), IndexPath(item: 4, section: 0), IndexPath(item: 5, section: 0)]
        )

        XCTAssert(self.provider.elements.count == currentCount - 3)
        XCTAssert(self.provider.elements.contains(tuples[0].food) == false) // Hamburger
        XCTAssert(self.provider.elements.contains(tuples[1].food) == false) // Müsli
        XCTAssert(self.provider.elements.contains(tuples[2].food) == false) // Barbecue
    }

    func testInsertElementAtIndexPath() {
        let currentCount: Int = self.provider.elements.count
        let apple: String = "Apple"
        self.provider.insert(element: apple, at: IndexPath(item: 1, section: 0))

        XCTAssert(self.provider.elements.count == currentCount + 1)
        XCTAssert(self.provider.elements.contains(apple))
        XCTAssert(self.provider.elements.firstIndex(of: apple)! == 1)
    }

    func testSetElements() {
        let fruits: [String] = ["Apple", "Banana", "Cantalope", "Date"]
        self.provider.set(elements: fruits)

        XCTAssert(self.provider.elements == fruits)
    }

    func testRemoveAll() {
        self.provider.removeAll()

        XCTAssert(self.provider.elements.isEmpty)
    }
}
