//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public extension Dictionary {
    /**
     Mutating method that combines the dictionary with another dictionary.

     - parameter dictionary: The dictionary to combine with.
    */
    public mutating func combine(dictionary: [Key: Value]) {
        dictionary.forEach { (dict: (key: Key, value: Value)) -> Void in
            self[dict.key] = dict.value
        }
    }

    /**
     Method that creates a new dictionary instance with combined values.

     - parameter dictionary: The dictionary to combine with.
    */
    public func combined(dictionary: [Key: Value]) -> [Key: Value] {
        var newDict: [Key: Value] = self
        newDict.combine(dictionary: dictionary)
        return newDict
    }
}
