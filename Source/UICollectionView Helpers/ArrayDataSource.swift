//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

/**
 A subclass of the DataSource class that works together with the ArrayProvider class.
*/
open class ArrayDataSource<Element, Cell: ConfigurableCell<Element>>: DataSource<ArrayProvider<Element>, Cell> {

    /**
     Initializer for an ArrayDataSource instance
     - parameter elements: Array of Type to be managed by an ArrayProvider instance
     - parameter collectionView: UICollectionView instance to be managed
    */
    public init(elements: [Element], collectionView: UICollectionView) {

        super.init(provider: ArrayProvider(elements: elements), collectionView: collectionView)

    }

    /**
     Array of elements managed by the DataProviding instance. Get-only property
    */
    open var elements: [Element] {
        return self.provider.elements
    }

    /**
     Mutating function that adds an element to the end of the array of elements
     - parameter element: Element to be added to the array.
     */
    open func add(element: Element) {
        self.provider.add(element: element)
    }

    /**
     Mutating function that removes an element from the array of elements
     - parameter element: Element to be removed from the array.
     - parameter indexPath: The index of the element to be removed.
     */
    open func remove(element: Element, at indexPath: IndexPath) {
        self.provider.remove(element: element, at: indexPath)
    }

    /**
     Mutating function that adds elements to the end of the array of elements
     - parameter elements: Elements to be added to the array.
     */
    open func add(elements: [Element]) {
        self.provider.add(elements: elements)
    }

    /**
     Mutating function that removes elements from the array of elements. The elements and indexPaths are combined with
     the zip function then sorted by biggest indexPath to prevent invalid indexes then finally each element is removed
     from the array by its paired indexPath.
     - parameter elements: Elements to be removed from the array.
     - parameter indexPaths: The indexes of the elements to be removed.
     */
    open func remove(elements: [Element], at indexPaths: [IndexPath]) {
        self.provider.remove(elements: elements, at: indexPaths)
    }

    /**
     Mutating function that replaces the array with a new array
     - parameter elements: Elements to become the new array.
     */
    open func set(elements: [Element]) {
        self.provider.set(elements: elements)
    }

    /**
     Gets the element at the specified indexPath
     - parameter indexPath: Index of the element in the array.
    */
    open func element(at indexPath: IndexPath) {
        self.provider.element(at: indexPath)
    }



}
