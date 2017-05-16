//
//  Configurable.swift
//  swift3-pokedex
//
//  Created by Julio Alorro on 2/9/17.
//  Copyright © 2017 Some Enterprises, Inc. All rights reserved.
//

public protocol Configurable: class {

    associatedtype Object

    static var identifier: String { get }

    func configure(with _: Object)
}
