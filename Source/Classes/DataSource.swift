//
//  Rapid
//  Copyright © Julio Alorro 2017
//
//  Licensed under the MIT license. See LICENSE file.
//
//

open class DataSource<Provider: DataProviding, Cell: UICollectionViewCell>: JAObject, UICollectionViewDataSource
    where Cell: Configurable, Provider.Object == Cell.Object {

    // MARK: Initializers
    public init(provider: Provider, collectionView: UICollectionView) {
        self._provider = provider
        self._collectionView = collectionView
        super.init()
        self.setup()
    }

    // MARK: Stored Properties
    /**
     Instance constant of Provider
    */
    fileprivate let _provider: Provider
    
    /**
     Instance constant of the collectionView
    */
    fileprivate unowned let _collectionView: UICollectionView

    // MARK: Computed Properties
    /**
     Returns the Provider instance that carries the collection for the collectionView. Get-only property.
    */
    public var provider: Provider {
        return self._provider
    }

    /**
     Returns the UICollectionView instance. Get-only property.
    */
    public var collectionView: UICollectionView {
        return self._collectionView
    }

    // MARK: - Instance Methods
    /**
     The setup method is boilerplate code that assigns the collectionView's dataSource as self and
     registers the specified cell to the collectionView with a given identifier
    */
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
