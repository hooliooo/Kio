//
//  ReadOnlyDictionary.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import Foundation

public struct ReadOnlyDictionary<Key: RawRepresentable, Value> where Key.RawValue: Hashable {

    private let _dictionary: [Key.RawValue: Value]

    var dictionary: [Key.RawValue: Value] {
        return self._dictionary
    }

    subscript(key: Key) -> Value {
        return self._dictionary[key.rawValue]!
    }
}
