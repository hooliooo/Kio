//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
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
    fileprivate var _objects: [Object]

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

    /**
     Returns the number of objects in the objects array
    */
    public func numberOfRows(in section: Int) -> Int {
        return self.objects.count
    }

    /**
     Returns the object at the specifided indexPath
    */
    public func object(at indexPath: IndexPath) -> Object {
        return self.objects[indexPath.row]
    }

    /**
     Mutating function that adds an object to the end of the array of objects
    */
    public func add(object: Object) {
        self._objects.append(object)
    }

    /**
     Mutating function that removes an object from the array of objects
    */
    public func remove(object: Object, at indexPath: IndexPath) {
        self._objects.remove(at: indexPath.row)
    }

}
