//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 The Configurable protocol defines the interface of the UICollectionViewCell type that 
 will work with a DataSource class or subclass
*/
public protocol Configurable: class {

    /**
     Object is a placeholder type that will be used to for data binding to the UICollectionViewCell instance
    */
    associatedtype Object

    /**
     The String identifier used by the Configurable UICollectionViewCell used to register to a UICollectionViewCell instance
    */
    static var identifier: String { get }

    /**
     The method that will read the Object instance and display the necessary info to the UI as well any other logic.
     - paramater _: Parameter name is customized. The object used for UICollectionViewCell UI configuration
    */
    func configure(with _: Object)
}
