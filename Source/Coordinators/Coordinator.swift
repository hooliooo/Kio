//
//  Kio
//  Copyright (c) 2017-2018 Julio Miguel Alorro
//
//  Licensed under the MIT license. See LICENSE file.
//
//

/**
 The Coordinator is a controller object that manages the navigation flow of an application by calling
 its UIViewController's methods and properties related to navigation instead of the UIViewController calling
 these properties and methods
 
 The Coordinator also manages model mutation and data fetching for its underlying UIViewController.
 
 The Coordinator communicates with its underlying UIViewController via delegattion
*/
public protocol Coordinator: class {

    /**
     An Array of Coordinators the Coordinator manages
    */
    var childCoordinators: [Coordinator] { get }

    /**
     Add child coordinator to childCoordinators array
     - parameter coordinator: Coordinator to add.
    */
    func add(childCoordinator coordinator: Coordinator)

    /**
     Remove child coordinator to childCoordinators array
     - parameter coordinator: Coordinator to remove.
    */
    func remove(childCoordinator coordinator: Coordinator)

    /**
     The start method is where the Coordinator executes its setup logic to manage its UIViewController.
     This should only be called once in the entire lifetime of the Coordinator instance.
     Calling this more than once results in a forced fatalError.
     Must call super.
    */
    func start()

}
