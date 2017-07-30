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
    init(elements: [Element]) {
        self.elements = elements
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
    fileprivate var elements: [Element]

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
        var count: Int = 0
        self._queue.sync {
            count = self.elements.count
        }
        return count
    }

    /**
     Synchronous read of the array's description property.
    */
    var description: String {
        var description: String = ""
        self._queue.sync {
            description = self.elements.description
        }
        return description
    }

    /**
     Synchronous read of the array's first property.
    */
    var first: Element? {
        var first: Element?
        self._queue.sync {
            first = self.elements.first
        }
        return first
    }

    /**
     Synchronous read of the array's isEmpty property.
    */
    var isEmpty: Bool {
        var isEmpty: Bool = true
        self._queue.sync {
            isEmpty = self.elements.isEmpty
        }
        return isEmpty
    }

    /**
     Synchronous read of the array's last property.
    */
    var last: Element? {
        var last: Element?
        self._queue.sync {
            last = self.elements.last
        }
        return last
    }

    /**
     Synchronous read of the array's contains method
    */
    func contains(where predicate: (Element) throws -> Bool) rethrows -> Bool {
        var result: Bool = false
        try self._queue.sync {
            result = try self.elements.contains(where: predicate)
        }
        return result
    }

    /**
     Synchronous read of the array's first method.
    */
    func first(where predicate: (Element) throws -> Bool) rethrows -> Element? {
        var result: Element?
        try self._queue.sync {
            result = try self.elements.first(where: predicate)
        }
        return result
    }

    /**
     Synchronous read of the array's filter method.
    */
    func filter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        var result: [Element] = []
        try self._queue.sync {
            result = try self.elements.filter(isIncluded)
        }
        return result
    }

    /**
     Synchronous read of the array's flatMap<SegmentOfResult> method
    */
    func flatMap<SegmentOfResult>(_ transform: (Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Iterator.Element] where SegmentOfResult : Sequence {
        var result: [SegmentOfResult.Iterator.Element] = []
        try self._queue.sync {
            result = try self.elements.flatMap(transform)
        }
        return result
    }

    /**
     Synchronous read of the array's flatMap<ElementOfResult> method
    */
    func flatMap<ElementOfResult>(_ transform: (Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {
        var result: [ElementOfResult] = []
        try self._queue.sync {
            result = try self.elements.flatMap(transform)
        }
        return result
    }

    /**
     Synchronous read of the array's forEach method
    */
    func forEach(_ body: (Element) -> Void) {
        return self._queue.sync {
            return self.elements.forEach(body)
        }
    }

    /**
     Synchronous read of the array's index method
    */
    func index(where predicate: (Element) -> Bool) -> Int? {
        var index: Int?
        self._queue.sync {
            index = self.elements.index(where: predicate)
        }
        return index
    }

    /**
     Synchronous read of the array's map method
    */
    func map<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var result: [T] = []
        try self._queue.sync {
            result = try self.elements.map(transform)
        }
        return result
    }

    /**
     Synchronous read of the array's reduce method
    */
    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        var result: Result = initialResult
        try self._queue.sync {
            result = try self.elements.reduce(initialResult, nextPartialResult)
        }
        return result
    }

    /**
     Synchronous read of the array's sorted method
    */
    func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element] {
        var result: [Element] = []
        self._queue.sync {
            result = self.elements.sorted(by: areInIncreasingOrder)
        }
        return result
    }
}

// MARK: - Write Methods
public extension SynchronizedArray {
    /**
     Asynchronous write of the array's append method for a single Element
    */
    func append(_ newElement: Element) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            self.elements.append(newElement)
        }
    }

    /**
     Asynchronous write of the array's append method for an array of Elements
    */
    func append<S>(contentsOf newElements: S) where S : Sequence, S.Iterator.Element == Element {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            self.elements.append(contentsOf: newElements)
        }
    }

    /**
     Asynchronous write of the array's insert(_, at:) method
    */
    func insert(_ newElement: Element, at i: Int) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            self.elements.insert(newElement, at: i)
        }
    }
    /**
     Asynchronous write of the array's remove(at:) method
    */
    func remove(at index: Int, callback: @escaping (Element) -> Void) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            DispatchQueue.main.async {
                callback(self.elements.remove(at: index))
            }
        }
    }

    /**
     Asynchronous write of the array's remove(where:) method
    */
    func remove(where predicate: @escaping (Element) -> Bool, callback: ((Element) -> Void)? = nil) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            guard let index = self.elements.index(where: predicate) else { return }

            let element = self.elements.remove(at: index)

            DispatchQueue.main.async {
                callback?(element)
            }
        }
    }

    /**
     Asynchronous write of the array's removeAll method
    */
    func removeAll(callback: (([Element]) -> Void)? = nil) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            let elements: [Element] = self.elements

            self.elements.removeAll()
            DispatchQueue.main.async {
                callback?(elements)
            }
        }
    }
}

public extension SynchronizedArray where Element: Equatable {
    /**
     Synchronous read of the array's contains method
    */
    func contains(_ element: Element) -> Bool {
        var result: Bool = false
        self._queue.sync {
            result = self.elements.contains(element)
        }
        return result
    }
}
