//
//  ArrayDataSource.swift
//  Rapid
//
//  Created by Julio Alorro on 2/27/17.
//
//

open class ArrayDataSource<Type, Cell: UICollectionViewCell>: DataSource<ArrayProvider<Type>, Cell>
    where Cell: Configurable, Cell.Object == Type {

    public init(array: [Type], collectionView: UICollectionView) {

        super.init(provider: ArrayProvider(objects: array), collectionView: collectionView)

    }

    public var objects: [Type] {
        return self.provider.objects
    }

}
