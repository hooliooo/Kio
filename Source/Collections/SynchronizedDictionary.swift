//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public class SynchronizedDictionary<Key: Hashable, Value> {
    /**
     The initializer
     - parameter dict: Dictionary instance to be managed
    */
    public init(dict: [Key: Value]) {
        self.dictionary = dict
    }

    /**
     The queue that handles the read/writes to the dictionary instance.
    */
    fileprivate let _queue: DispatchQueue = DispatchQueue(
        label: "SynchronizedDictionary",
        attributes: DispatchQueue.Attributes.concurrent
    )

    /**
     The dictionary instance.
    */
    fileprivate var dictionary: [Key: Value]

    // MARK: Computed Properties
    /**
     The DispatchQueue instance used by the SynchronizedDictionary instance
    */
    public var queue: DispatchQueue {
        return self._queue
    }
}

// MARK: - Read Properties & Methods
public extension SynchronizedDictionary {
    /**
     Synchronous read of the dictionary's count property.
    */
    var count: Int {
        return self._queue.sync { return self.dictionary.count }
    }
    /**
     Synchronous read of the dictionary's first property.
    */
    var first: (key: Key, value: Value)? {
        return self._queue.sync { return self.dictionary.first }
    }

    /**
     Synchronous read of the dictionary's isEmpty property.
    */
    var isEmpty: Bool {
        return self._queue.sync { return self.dictionary.isEmpty }
    }

    /**
     Synchronous read of the dictionary's key property.
    */
    var keys: LazyMapCollection<[Key : Value], Key> {
        return self._queue.sync { return self.dictionary.keys }
    }

    /**
     Synchronous read of the dictionary's underestimatedCount property.
    */
    var underestimatedCount: Int {
        return self._queue.sync { return self.dictionary.underestimatedCount }
    }

    /**
     Synchronous read of the dictionary's values property.
    */
    var values: LazyMapCollection<[Key : Value], Value> {
        return self._queue.sync { return self.dictionary.values }
    }

    /**
     Synchronous read of the dictionary's contains method.
    */
    func contains(where predicate: (Key, Value) throws -> Bool) rethrows -> Bool {
        return try self._queue.sync {
            do {

                return try self.dictionary.contains(where: predicate)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's enumerated method.
    */
    func enumerated() -> EnumeratedSequence<Dictionary<Key, Value>> { // swiftlint:disable:this syntactic_sugar
        return self._queue.sync { return self.dictionary.enumerated() }
    }

    /**
     Synchronous read of the dictionary's filter method.
    */
    func filter(_ isIncluded: (Key, Value) throws -> Bool) rethrows -> [(key: Key, value: Value)] {
        return try self._queue.sync {
            do {

                return try self.dictionary.filter(isIncluded)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's first method.
    */
    func first(where predicate: ((key: Key, value: Value)) throws -> Bool) rethrows -> (key: Key, value: Value)? {

        return try self._queue.sync {

            do {

                return try self.dictionary.first(where: predicate)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's flatMap<ElementOfResult> method.
    */
    func flatMap<ElementOfResult>(_ transform: (Key, Value) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {

        return try self._queue.sync {
            do {

                return try self.dictionary.flatMap(transform)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's flatMap<SegmentOfResult> method.
    */
    func flatMap<SegmentOfResult : Sequence>(_ transform: (Key, Value) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Iterator.Element] {

        return try self._queue.sync {
            do {

                return try self.dictionary.flatMap(transform)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's forEach method.
    */
    func forEach(_ body: (Key, Value) throws -> Void) rethrows {

        return try self._queue.sync {
            do {

                return try self.dictionary.forEach(body)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's index method.
    */
    func index(where predicate: (Key, Value) throws -> Bool) rethrows -> DictionaryIndex<Key, Value>? {

        return try self._queue.sync {
            do {

                return try self.dictionary.index(where: predicate)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's map<T> method.
    */
    func map<T>(_ transform: (Key, Value) throws -> T) rethrows -> [T] {

        return try self._queue.sync {
            do {

                return try self.dictionary.map(transform)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's reduce<Result> method.
    */
    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, (key: Key, value: Value)) throws -> Result) rethrows -> Result {

        return try self._queue.sync {
            do {

                return try self.dictionary.reduce(initialResult, nextPartialResult)

            } catch let error {

                throw error

            }
        }
    }

    /**
     Synchronous read of the dictionary's reversed method.
    */
    func reversed() -> [(key: Key, value: Value)] {
        return self._queue.sync { self.dictionary.reversed() }
    }
}

// MARK: - Write Methods
public extension SynchronizedDictionary {
    /**
     Asynchronous write of the dictionary's popFirst method.
    */
    func popFirst(callback: @escaping ((key: Key, value: Value)?) -> Void) {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            callback(self.dictionary.popFirst())
        }
    }

    /**
     Asynchronous write of the dictionary's removeAll method.
    */
    func removeAll() {
        self._queue.async(flags: DispatchWorkItemFlags.barrier) { self.dictionary.removeAll() }
    }

    /**
     Asynchronous write of the dictionary's updateValue method.
    */
    func updateValue(_ value: Value, forKey key: Key, callback: @escaping (Value?) -> Void) {
        return self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            callback(self.dictionary.updateValue(value, forKey: key))
        }
    }

    /**
     Asynchronous write of the dictionary's removeValue method.
    */
    func removeValue(forKey key: Key, callback: @escaping (Value?) -> Void) {
        return self._queue.async(flags: DispatchWorkItemFlags.barrier) {
            callback(self.dictionary.removeValue(forKey: key))
        }
    }
}

// MARK: - Subscript
public extension SynchronizedDictionary {
    /**
     Synchronous getter subscript.
     Asynchronous setter subscript.
    */
    subscript(key: Key) -> Value? {
        get {
            var value: Value?

            self._queue.sync {
                guard let dictValue = self.dictionary[key] else { return }
                value = dictValue
            }

            return value
        }

        set {

            guard let newValue = newValue else { return }

            self._queue.async(flags: DispatchWorkItemFlags.barrier) {
                self.dictionary[key] = newValue
            }

        }
    }
}
