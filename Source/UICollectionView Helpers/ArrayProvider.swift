//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 An implementation of the DataProviding protocol that manages a one dimensional array, 
 meaning that it is suitable for collectionViews with a single section.
*/
public final class ArrayProvider<Object>: DataProvider {

    /**
     Initializer for an ArrayProvider instance
     - parameter objects: Array of Type to be managed
    */
    public init(objects: [Object]) {
        self._objects = objects
    }

    // MARK: - Stored Properties
    /**
     Instance variable of objects
    */
    private var _objects: [Object]

    /**
     Array of objects. Get-only property
    */
    public var objects: [Object] {
        return self._objects
    }

    /**
     Returns 1. An ArrayProvider manages a one-dimensional array.
    */
    public func numberOfSections() -> Int {
        return 1
    }

    public func numberOfItems(in section: Int) -> Int {
        return self.objects.count
    }

    public func object(at indexPath: IndexPath) -> Object {
        return self.objects[indexPath.row]
    }

    /**
     Mutating function that adds an object to the end of the array of objects
     - parameter object: Object to be added to the array.
    */
    public func add(object: Object) {
        self._objects.append(object)
    }

    /**
     Mutating function that removes an object from the array of objects
     - parameter object: Object to be removed from the array.
     - parameter indexPath: The index of the object to be removed.
    */
    public func remove(object: Object, at indexPath: IndexPath) {
        self._objects.remove(at: indexPath.row)
    }

    /**
     Mutating function that adds objects to the end of the array of objects
     - parameter objects: Objects to be added to the array.
    */
    public func add(objects: [Object]) {
        objects.forEach { [unowned self] (object: Object) -> Void in
            self.add(object: object)
        }
    }

    /**
     Mutating function that removes objects from the array of objects
     - parameter objects: Objects to be removed from the array.
     - parameter indexPaths: The indexes of the objects to be removed.
    */
    public func remove(objects: [Object], at indexPaths: [IndexPath]) {
        zip(objects, indexPaths).forEach { [unowned self] (object: Object, indexPath: IndexPath) -> Void in
            self.remove(object: object, at: indexPath)
        }
    }
    /**
     Mutating function that replaces the array with a new array
     - parameter objects: Objects to become the new array.
    */
    public func set(objects: [Object]) {
        self._objects = objects
    }
}
