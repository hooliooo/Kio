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

    public init(array: [Type], collectionView: UICollectionView) {

        super.init(provider: ArrayProvider(objects: array), collectionView: collectionView)

    }

    public var objects: [Type] {
        return self.provider.objects
    }

}
