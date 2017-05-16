//
//  ReadOnlyDictionary.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//
//

/**
 A struct wrapper around a Dictionary instance that can access the dictionary by subcripting with Enumerations
 that conform to the RawRepresetable and Hashable protocols. Does not mutate the underlying Dictionary, 
 only accesses key-value pairs
*/
public struct ReadOnlyDictionary<Key: RawRepresentable, Value> where Key.RawValue: Hashable {

    public init(_ dictionary: [Key.RawValue: Value]) {
        self._dictionary = dictionary
    }

    private let _dictionary: [Key.RawValue: Value]

    public var dictionary: [Key.RawValue: Value] {
        return self._dictionary
    }

    public subscript(key: Key) -> Value {
        return self._dictionary[key.rawValue]!
    }
}
