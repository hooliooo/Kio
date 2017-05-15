//
//  ArrayProvider.swift
//  swift3-pokedex
//
//  Created by Julio Alorro on 2/27/17.
//  Copyright © 2017 Some Enterprises, Inc. All rights reserved.
//

import UIKit

public final class ArrayProvider<Type>: DataProviding {

    public init(objects: [Type]) {
        self._objects = objects
    }

    // MARK: - Stored Properties
    fileprivate var _objects: [Type]
    public var objects: [Type] {
        return self._objects
    }

    public func numberOfSections() -> Int { return 1 }

    public func numberOfRows(in section: Int) -> Int { return self.objects.count }

    public func object(at indexPath: IndexPath) -> Type { return self.objects[indexPath.row] }

}
