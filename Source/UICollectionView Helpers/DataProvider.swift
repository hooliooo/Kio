//
//  Kio
//  Copyright (c) Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import struct Foundation.IndexPath

/**
 The DataProvider manages an array of objects that will be shown in a UICollectionView instance
*/
public protocol DataProvider {

    /**
     Object is a placeholder type that will be used in the array managed by the DataProviding instance
    */
    associatedtype Element

    /**
     Number of sections to be shown in UICollectionView
    */
    func numberOfSections() -> Int

    /**
     Number of rows to be shown in section of UICollectionView
     - parameter section: Section index of UICollectionView
    */
    func numberOfItems(in section: Int) -> Int

    /**
     The element at the specific indexPath of the UICollectionView
     - parameter indexPath: IndexPath of the object to be shown
    */
    func element(at indexPath: IndexPath) -> Element?

}
