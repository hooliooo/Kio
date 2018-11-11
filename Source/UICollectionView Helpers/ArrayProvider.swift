//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import protocol Swift.Equatable
import struct Foundation.IndexPath

/**
 ArrayProvider manages a one dimensional array of a single type,meaning that it is
 suitable for collectionViews with a single section and uses one type of model.
*/
public final class ArrayProvider<Element: Equatable>: DataProvider {

    /**
     Initializer for an ArrayProvider instance
     - parameter elements: Array of Type to be managed
    */
    public init(elements: [Element]) {
        self._elements = elements
    }

    // MARK: - Stored Properties
    /**
     Instance variable of elements
    */
    private var _elements: [Element]

    /**
     Array of elements. Get-only property
    */
    public var elements: [Element] {
        return self._elements
    }

    /**
     Returns 1. An ArrayProvider manages a one-dimensional array.
    */
    public func numberOfSections() -> Int {
        return 1
    }

    public func numberOfItems(in section: Int) -> Int {
        return self.elements.count
    }

    public func element(at indexPath: IndexPath) -> Element? {
        guard indexPath.item < self.elements.count else { return nil }
        return self.elements[indexPath.item]
    }

    /**
     Mutating function that adds an element to the end of the array of elements
     - parameter element: Element to be added to the array.
    */
    public func add(element: Element) {
        self._elements.append(element)
    }

    /**
     Mutating function that removes an element from the array of elements
     - parameters:
        - element: Element to be removed from the array.
        - indexPath: The index of the element to be removed.
     - Returns: Element at the specified indexPath or nil.
    */
    @discardableResult
    public func remove(element: Element, at indexPath: IndexPath) -> Element? {
        guard
            let idx = self.elements.index(of: element),
            idx == indexPath.item
        else {
            return nil
        }

        return self._elements.remove(at: idx)

    }

    /**
     Mutating function that adds elements to the end of the array of elements
     - parameter elements: Elements to be added to the array.
    */
    public func add(elements: [Element]) {
        self._elements.append(contentsOf: elements)
    }

    /**
     Mutating function that inserts an ojbect at the specified indexPath
     - parameter element: Element to be inserted in the array.
    */
    public func insert(element: Element, at indexPath: IndexPath) {
        self._elements.insert(element, at: indexPath.item)
    }

    /**
     Mutating function that removes elements from the array of elements. The elements and indexPaths are combined with
     the zip function then sorted by biggest indexPath to prevent invalid indexes then finally each element is removed
     from the array by its paired indexPath.
     - parameters:
        - elements: Elements to be removed from the array.
        - indexPaths: The indexes of the elements to be removed.
     - Returns: An array of type (Element, IndexPath).
    */
    public func remove(elements: [Element], at indexPaths: [IndexPath]) -> [(Element, IndexPath)] {
        return zip(elements, indexPaths).lazy // swiftlint:disable:next line_length
            .sorted(by: { (lhs: (element: Element, indexPath: IndexPath), rhs: (element: Element, indexPath: IndexPath)) -> Bool in
                return lhs.indexPath > rhs.indexPath
            })
            .compactMap { (element: Element, indexPath: IndexPath) -> (Element, IndexPath)? in
                guard let element = self.remove(element: element, at: indexPath) else { return nil }
                return (element, indexPath)
            }
    }

    /**
     Mutating function that replaces the array with a new array
     - parameter elements: Elements to become the new array.
    */
    public func set(elements: [Element]) {
        self._elements = elements
    }

    /**
     Mutating function that removes all elements in the array
    */
    public func removeAll() {
        self._elements.removeAll()
    }
}
