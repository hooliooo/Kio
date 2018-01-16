//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A subclass of the DataSource class that works together with the ArrayProvider class.
*/
open class ArrayDataSource<Object, Cell: ConfigurableCell<Object>>: DataSource<ArrayProvider<Object>, Cell> {

    /**
     Initializer for an ArrayDataSource instance
     - parameter objects: Array of Type to be managed by an ArrayProvider instance
     - parameter collectionView: UICollectionView instance to be managed
    */
    public init(objects: [Object], collectionView: UICollectionView) {

        super.init(provider: ArrayProvider(objects: objects), collectionView: collectionView)

    }

    /**
     Array of objects managed by the DataProviding instance. Get-only property
    */
    open var objects: [Object] {
        return self.provider.objects
    }

}
