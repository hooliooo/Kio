//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

public protocol Configurable: class {

    associatedtype Object

    static var identifier: String { get }

    func configure(with _: Object)
}
