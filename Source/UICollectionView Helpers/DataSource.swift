//
//  Rapid
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 DataSource is the class that adopts the UICollectionViewDataSource protcol and manages the boilerplate set up for
 using UICollectionView
*/
open class DataSource<Provider: DataProvider, Cell: ConfigurableCell<Provider.Element>>: JAObject, UICollectionViewDataSource {

    // MARK: Initializers
    /**
     Initializer for the DataSource instance
     - parameter provider: DataProviding type that contains information regarding the array it manages
     - parameter collectionView: UICollectionView instance to be managed
    */
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
    private let _provider: Provider

    /**
     Instance constant of the collectionView
    */
    private unowned let _collectionView: UICollectionView

    // MARK: Computed Properties
    /**
     Returns the Provider instance that carries the collection for the collectionView. Get-only property.
    */
    open var provider: Provider {
        return self._provider
    }

    /**
     Returns the UICollectionView instance. Get-only property.
    */
    open var collectionView: UICollectionView {
        return self._collectionView
    }

    // MARK: - Instance Methods
    /**
     The setup method is boilerplate code that assigns the collectionView's dataSource as self and
     registers the specified cell to the collectionView with a given identifier
    */
    open func setup() {
        self._collectionView.dataSource = self
        self._collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
    }

    // MARK: - UICollectionViewDataSource Methods
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self._provider.numberOfSections()
    }

    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self._provider.numberOfItems(in: section)
    }

    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // swiftlint:disable:next force_cast
        let cell: Cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let object: Provider.Element = self._provider.object(at: indexPath)
        cell.configure(with: object)
        return cell
    }

}
