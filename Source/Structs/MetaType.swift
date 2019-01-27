//
//  MetaType.swift
//  Kio-iOS
//
//  Created by Julio Miguel Alorro on 11/14/18.
//  Copyright © 2018 Some Enterprises. All rights reserved.
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
