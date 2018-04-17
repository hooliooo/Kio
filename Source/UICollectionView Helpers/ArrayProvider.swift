//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 An implementation of the DataProviding protocol that manages a one dimensional array, 
 meaning that it is suitable for collectionViews with a single section.
*/
public final class ArrayProvider<Element>: DataProvider {

    /**
     Initializer for an ArrayProvider instance
     - parameter objects: Array of Type to be managed
    */
    public init(elements: [Element]) {
        self._elements = elements
    }

    // MARK: - Stored Properties
    /**
     Instance variable of objects
    */
    private var _elements: [Element]

    /**
     Array of objects. Get-only property
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

    public func object(at indexPath: IndexPath) -> Element {
        return self.elements[indexPath.row]
    }

    /**
     Mutating function that adds an object to the end of the array of objects
     - parameter object: Object to be added to the array.
    */
    public func add(element: Element) {
        self._elements.append(element)
    }

    /**
     Mutating function that removes an object from the array of objects
     - parameter object: Object to be removed from the array.
     - parameter indexPath: The index of the object to be removed.
    */
    public func remove(element: Element, at indexPath: IndexPath) {
        self._elements.remove(at: indexPath.row)
    }

    /**
     Mutating function that adds objects to the end of the array of objects
     - parameter objects: Objects to be added to the array.
    */
    public func add(elements: [Element]) {
        elements.forEach { [unowned self] (element: Element) -> Void in
            self.add(element: element)
        }
    }

    /**
     Mutating function that removes objects from the array of objects. The objects and indexPaths are combined with
     the zip function then sorted by biggest indexPath to prevent invalid indexes then finally each object is removed
     from the array by its paired indexPath.
     - parameter objects: Objects to be removed from the array.
     - parameter indexPaths: The indexes of the objects to be removed.
    */
    public func remove(elements: [Element], at indexPaths: [IndexPath]) {
        zip(elements, indexPaths)
            .sorted(by: { $0.1 > $1.1 })
            .forEach { [unowned self] (element: Element, indexPath: IndexPath) -> Void in
                self.remove(element: element, at: indexPath)
            }
    }
    /**
     Mutating function that replaces the array with a new array
     - parameter objects: Objects to become the new array.
    */
    public func set(elements: [Element]) {
        self._elements = elements
    }
}
