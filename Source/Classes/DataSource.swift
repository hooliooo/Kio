//
//  DataSource.swift
//  swift3-pokedex
//
//  Created by Julio Alorro on 2/27/17.
//  Copyright © 2017 Some Enterprises, Inc. All rights reserved.
//

import UIKit

open class DataSource<Provider: DataProviding, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource
    where Cell: Configurable, Provider.Object == Cell.Object {

    // MARK: - Initializers
    public init(provider: Provider, collectionView: UICollectionView) {
        self._provider = provider
        self._collectionView = collectionView
        super.init()
        self.setup()
    }

    // MARK: - Stored Properties
    fileprivate let _provider: Provider
    fileprivate unowned let _collectionView: UICollectionView

    public var provider: Provider {
        return self._provider
    }

    public var collectionView: UICollectionView {
        return self._collectionView
    }

    // MARK: - Methods
    public func setup() {
        self._collectionView.dataSource = self
        self._collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
    }

    // MARK: - UICollectionViewDataSource Methods
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self._provider.numberOfSections()
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._provider.numberOfRows(in: section)
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable:next force_cast
        let cell: Cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let object: Provider.Object = self._provider.object(at: indexPath)
        cell.configure(with: object)
        return cell
    }

}
