//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 A subclass of the DataSource class that works together with the ArrayProvider class.
*/
open class ArrayDataSource<Type, Cell: UICollectionViewCell>: DataSource<ArrayProvider<Type>, Cell>
    where Cell: Configurable, Cell.Object == Type {

    /**
     Initializer for an ArrayDataSource instance
     - parameter objects: Array of Type to be managed by an ArrayProvider instance
     - parameter collectionView: UICollectionView instance to be managed
    */
    public init(objects: [Type], collectionView: UICollectionView) {

        super.init(provider: ArrayProvider(objects: objects), collectionView: collectionView)

    }

    /**
     Array of objects managed by the DataProviding instance. Get-only property
    */
    public var objects: [Type] {
        return self.provider.objects
    }

}
