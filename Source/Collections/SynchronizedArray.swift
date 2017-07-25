//
//  Rapid
//  Copyright (c) 2017 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

public class SynchronizedArray<Element> {

    /**
     The initializer
     - parameter dict: Array instance to be managed
    */
    init(array: [Element]) {
        self.array = array
    }

    // MARK: Stored Properties
    /**
     The queue that handles the read/writes to the array instance.
    */
    fileprivate let _queue: DispatchQueue = DispatchQueue(
        label: "SynchronizedArray",
        attributes: [DispatchQueue.Attributes.concurrent]
    )

    /**
     The array instance.
    */
    fileprivate var array: [Element]

    // MARK: - Computed Properties
    /**
     The DispatchQueue instance used by the SynchronizedArray instance
    */
    public var queue: DispatchQueue {
        return self._queue
    }
}

// MARK: Read Properties & Methods
public extension SynchronizedArray {
    /**
     Synchronous read of the array's count property.
    */
    var count: Int {
        return self._queue.sync {
            return self.array.count
        }
    }

    /**
     Synchronous read of the array's description property.
    */
    var description: String {
        return self._queue.sync {
            return self.array.description
        }
    }

    /**
     Synchronous read of the array's first property.
    */
    var first: Element? {
        return self._queue.sync {
            return self.array.first
        }
    }

    /**
     Synchronous read of the array's isEmpty property.
    */
    var isEmpty: Bool {
        return self._queue.sync {
            return self.array.isEmpty
        }
    }

    /**
     Synchronous read of the array's last property.
    */
    var last: Element? {
        return self._queue.sync {
            return self.array.last
        }
    }

    /**
     Synchronous read of the array's contains method
    */
    func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        return try self._queue.sync {
            return try self.array.contains(where: predicate)
        }
    }

    /**
     Synchronous read of the array's first method.
    */
    func first(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        return try self._queue.sync {
            return try self.array.first(where: predicate)
        }
    }

    /**
     Synchronous read of the array's filter method.
    */
    func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        return try self._queue.sync {
            return try self.array.filter(isIncluded)
        }
    }

    /**
     Synchronous read of the array's flatMap<SegmentOfResult> method
    */
    func flatMap<SegmentOfResult>(_ transform: (Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Iterator.Element] where SegmentOfResult : Sequence {
        return try self._queue.sync {
            return try self.array.flatMap(transform)
        }
    }

    /**
     Synchronous read of the array's flatMap<ElementOfResult> method
    */
    func flatMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        return try self._queue.sync {
            return try self.array.flatMap(transform)
        }
    }

    /**
     Synchronous read of the array's forEach method
    */
    func forEach(_ body: (Element) -> Void) {
        return self._queue.sync {
            return self.array.forEach(body)
        }
    }

    /**
     Synchronous read of the array's index method
    */
    func index(where predicate: (Element) -> Bool) -> Int? {
        return self._queue.sync {
            return self.array.index(where: predicate)
        }
    }

    /**
     Synchronous read of the array's map method
    */
    func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        return try self._queue.sync {
            return try self.array.map(transform)
        }
    }

    /**
     Synchronous read of the array's reduce method
    */
    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        return try self._queue.sync {
            return try self.array.reduce(initialResult, nextPartialResult)
        }
    }

    /**
     Synchronous read of the array's sorted method
    */
    func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        return self._queue.sync {
            return self.array.sorted(by: areInIncreasingOrder)
        }
    }
}

// MARK: - Write Methods
public extension SynchronizedArray {
    /**
     Asynchronous write of the array's append method for a single Element
    */
    func append(_ newElement: Element) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            self.array.append(newElement)
        }
    }

    /**
     Asynchronous write of the array's append method for an array of Elements
    */
    func append<S>(contentsOf newElements: S) where S : Sequence, S.Iterator.Element == Element {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            self.array.append(contentsOf: newElements)
        }
    }

    /**
     Asynchronous write of the array's insert(_, at:) method
    */
    func insert(_ newElement: Element, at i: Int) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            self.array.insert(newElement, at: i)
        }
    }
    /**
     Asynchronous write of the array's remove(at:) method
    */
    func remove(at index: Int, callback: @escaping (Element) -> Void) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            callback(self.array.remove(at: index))
        }
    }

    /**
     Asynchronous write of the array's remove(where:) method
    */
    func remove(where predicate: @escaping (Element) -> Bool, callback: ((Element) -> Void)? = nil) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            guard let index = self.array.index(where: predicate) else { return }

            let element = self.array.remove(at: index)

            callback?(element)
        }
    }

    /**
     Asynchronous write of the array's removeAll method
    */
    func removeAll(callback: (([Element]) -> Void)? = nil) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            let elements: [Element] = self.array

            self.array.removeAll()

            callback?(elements)
        }
    }
}

public extension SynchronizedArray where Element: Equatable {
    func contains(_ element: Element) -> Bool {
        return self._queue.sync {
            return self.array.contains(element)
        }
    }
}
