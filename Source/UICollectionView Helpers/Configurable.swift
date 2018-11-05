//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import UIKit

/**
 The Configurable protocol defines the interface of the UICollectionViewCell type that 
 will work with a DataSource class or subclass
*/
public protocol Configurable: class {

    /**
     Object is a placeholder type that will be used to for data binding to the UICollectionViewCell instance
    */
    associatedtype ViewModel

    /**
     The method that will read the Object instance and display the necessary info to the UI as well any other logic.
     - paramater _: Parameter name is customized. The object used for UICollectionViewCell UI configuration
    */
    func configure(with _: ViewModel)
}

/**
 A UICollectionViewCell implementation of the Configurable protocol
*/
open class ConfigurableCell<ViewModel>: UICollectionViewCell, Configurable {

    /**
     The String identifier used by the ConfigurableCell to register to a UICollectionView instance
    */
    open class var identifier: String {
        return String(describing: Mirror(reflecting: self).subjectType)
    }

    open func configure(with _: ViewModel) {
        fatalError("Override this")
    }

}
