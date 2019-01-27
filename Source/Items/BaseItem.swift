//
//  BaseItem.swift
//  Kio-iOS
//
//  Created by Julio Miguel Alorro on 1/26/19.
//  Copyright © 2019 Some Enterprises. All rights reserved.
//

import UIKit

public protocol BaseItem {

    associatedtype T: State

    init(state: T)

    var state: T { get }

}

