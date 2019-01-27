//
//  AnyItem.swift
//  Kio-iOS
//
//  Created by Julio Miguel Alorro on 1/26/19.
//  Copyright © 2019 Some Enterprises. All rights reserved.
//

import Foundation

public class AnyItem {

    // MARK: Initializer
    public init<T: BaseItem>(item: T) {
        self.state = item.state
    }

    // Stored Properties
    public let state: State

}
