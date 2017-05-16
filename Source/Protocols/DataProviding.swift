//
//  DataProviding.swift
//  swift3-pokedex
//
//  Created by Julio Alorro on 2/27/17.
//  Copyright © 2017 Some Enterprises, Inc. All rights reserved.
//

public protocol DataProviding {

    associatedtype Object
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func object(at indexPath: IndexPath) -> Object

}
