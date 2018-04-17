//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

import Foundation

/**
 The DataProvider protcol defines the interface of the type that will manage an array of objects
 that will be shown in a UICollectionView instance
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
     The object at the specific indexPath of the UICollectionView
     - parameter indexPath: IndexPath of the object to be shown
    */
    func object(at indexPath: IndexPath) -> Element

}
