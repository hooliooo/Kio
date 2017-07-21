//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A struct wrapper around a Dictionary instance that can access the dictionary by subcripting with Enumerations
 that conform to the RawRepresetable and Hashable protocols. Does not mutate the underlying Dictionary, 
 only accesses key-value pairs
*/
public struct ReadOnlyDictionary<Key: RawRepresentable, Value> where Key.RawValue: Hashable {

    /**
     Initializer for ReadOnlyDictionary instance
     - parameter dictionary: Dictionary instance to be read
    */
    public init(_ dictionary: [Key.RawValue: Value]) {
        self._dictionary = dictionary
    }

    /**
     Dictionary instance being read
    */
    private let _dictionary: [Key.RawValue: Value]

    /**
     Dictionary instance being read
    */
    public var dictionary: [Key.RawValue: Value] {
        return self._dictionary
    }

    /**
     Getter for value to be read via key
    */
    public subscript(key: Key) -> Value {
        return self._dictionary[key.rawValue]!
    }
}
