//
//  SynchronizedDictionary.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import Foundation

public class SynchronizedDictionary<Key: Hashable, Value> {

    fileprivate let queue: DispatchQueue = DispatchQueue(
        label: "SynchronizedDictionary",
        attributes: DispatchQueue.Attributes.concurrent
    )

    fileprivate var dictionary: [Key: Value]

    public init(dict: [Key: Value]) {
        self.dictionary = dict
    }

}

// MAKR: - Read Properties & Methods
public extension SynchronizedDictionary {

    var count: Int {
        return self.queue.sync { return self.dictionary.count }
    }

    var first: (key: Key, value: Value)? {
        return self.queue.sync { return self.dictionary.first }
    }

    var isEmpty: Bool {
        return self.queue.sync { return self.dictionary.isEmpty }
    }

    var keys: LazyMapCollection<[Key : Value], Key> {
        return self.queue.sync { return self.dictionary.keys }
    }

    var underestimatedCount: Int {
        return self.queue.sync { return self.dictionary.underestimatedCount }
    }

    var values: LazyMapCollection<[Key : Value], Value> {
        return self.queue.sync { return self.dictionary.values }
    }

    func contains(where predicate: (Key, Value) throws -> Bool) rethrows -> Bool {
        return try self.queue.sync {
            do {

                return try self.dictionary.contains(where: predicate)

            } catch let error {

                throw error

            }
        }
    }

    func enumerated() -> EnumeratedSequence<Dictionary<Key, Value>> { // swiftlint:disable:this syntactic_sugar
        return self.queue.sync { return self.dictionary.enumerated() }

    }

    func filter(_ isIncluded: (Key, Value) throws -> Bool) rethrows -> [(key: Key, value: Value)] {
        return try self.queue.sync {
            do {

                return try self.dictionary.filter(isIncluded)

            } catch let error {

                throw error

            }
        }
    }

    func first(where predicate: ((key: Key, value: Value)) throws -> Bool) rethrows -> (key: Key, value: Value)? {

        return try self.queue.sync {

            do {

                return try self.dictionary.first(where: predicate)

            } catch let error {

                throw error

            }
        }
    }

    func flatMap<ElementOfResult>(_ transform: (Key, Value) throws -> ElementOfResult?) rethrows -> [ElementOfResult] {

        return try self.queue.sync {
            do {

                return try self.dictionary.flatMap(transform)

            } catch let error {

                throw error

            }
        }
    }

    func flatMap<SegmentOfResult : Sequence>(_ transform: (Key, Value) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Iterator.Element] {

        return try self.queue.sync {
            do {

                return try self.dictionary.flatMap(transform)

            } catch let error {

                throw error

            }
        }
    }

    func forEach(_ body: (Key, Value) throws -> Void) rethrows {

        return try self.queue.sync {
            do {

                return try self.dictionary.forEach(body)

            } catch let error {

                throw error

            }
        }
    }

    func index(where predicate: (Key, Value) throws -> Bool) rethrows -> DictionaryIndex<Key, Value>? {

        return try self.queue.sync {
            do {

                return try self.dictionary.index(where: predicate)

            } catch let error {

                throw error

            }
        }
    }

    func map<T>(_ transform: (Key, Value) throws -> T) rethrows -> [T] {

        return try self.queue.sync {
            do {

                return try self.dictionary.map(transform)

            } catch let error {

                throw error

            }
        }
    }

    func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, (key: Key, value: Value)) throws -> Result) rethrows -> Result {

        return try self.queue.sync {
            do {

                return try self.dictionary.reduce(initialResult, nextPartialResult)

            } catch let error {

                throw error

            }
        }
    }

    func reversed() -> [(key: Key, value: Value)] {
        return self.queue.sync { self.dictionary.reversed() }
    }
}

// MARK: - Write Methods
public extension SynchronizedDictionary {
    func popFirst(completionBlock: @escaping ((key: Key, value: Value)?) -> Void) {
        self.queue.async(flags: DispatchWorkItemFlags.barrier) {
            completionBlock(self.dictionary.popFirst())
        }
    }

    func removeAll() {
        self.queue.async(flags: DispatchWorkItemFlags.barrier) { self.dictionary.removeAll() }
    }

    func updateValue(_ value: Value, forKey key: Key, completionBlock: @escaping (Value?) -> Void) {
        return self.queue.async(flags: DispatchWorkItemFlags.barrier) {
            completionBlock(self.dictionary.updateValue(value, forKey: key))
        }
    }

    func removeValue(forKey key: Key, completionBlock: @escaping (Value?) -> Void) {
        return self.queue.async(flags: DispatchWorkItemFlags.barrier) {
            completionBlock(self.dictionary.removeValue(forKey: key))
        }
    }
}

// MARK: - Subscript
public extension SynchronizedDictionary {
    subscript(key: Key) -> Value? {
        get {
            var value: Value?

            self.queue.sync {
                guard let dictValue = self.dictionary[key] else { return }
                value = dictValue
            }

            return value
        }

        set {

            guard let newValue = newValue else { return }

            self.queue.async(flags: DispatchWorkItemFlags.barrier) {
                self.dictionary[key] = newValue
            }

        }
    }
}
