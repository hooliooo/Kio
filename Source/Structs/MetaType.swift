//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public struct MetaType<T>: Hashable {

    // MARK: Intiializer
    public init(_ base: T.Type) {
        self.base = base
    }

    // MARK: Stored Properties
    public let base: T.Type

    // MARK: Hashable Protocol
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self.base))
    }
    public static func == (lhs: MetaType, rhs: MetaType) -> Bool {
        return lhs.base == rhs.base
    }

}
