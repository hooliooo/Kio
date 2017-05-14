//
//  ReadOnlyDictionary.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import Foundation

public struct ReadOnlyDictionary<Key: RawRepresentable, Value> where Key.RawValue: Hashable {

    let dictionary: [Key.RawValue: Value]

    subscript(key: Key) -> Value {
        return self.dictionary[key.rawValue]!
    }
}
