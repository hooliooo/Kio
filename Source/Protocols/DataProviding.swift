//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public protocol DataProviding {

    associatedtype Object
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func object(at indexPath: IndexPath) -> Object

}
