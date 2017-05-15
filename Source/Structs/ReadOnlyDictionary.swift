//
//  ReadOnlyDictionary.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import Foundation

/**
 A struct wrapper around a Dictionary instance that can access the dictionary by subcripting with Enumerations
 that conform to the RawRepresetable and Hashable protocols. Does not mutate the underlying Dictionary, 
 only accesses key-value pairs
*/
public struct ReadOnlyDictionary<Key: RawRepresentable, Value> where Key.RawValue: Hashable {

    private let _dictionary: [Key.RawValue: Value]

    var dictionary: [Key.RawValue: Value] {
        return self._dictionary
    }

    subscript(key: Key) -> Value {
        return self._dictionary[key.rawValue]!
    }
}
