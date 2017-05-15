//
//  Coordinator.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//
//

import UIKit

/**
 The Coordinator is a controller object that manages the navigation flow of an application by calling
 its UIViewController's methods and properties related to navigation instead of the UIViewController calling
 these properties and methods
 
 The Coordinator also manages model mutation and data fetching for its underlying UIViewController.
*/
public protocol Coordinator: class {

    associatedtype ViewController: UIViewController

    func start()

    var viewController: ViewController { get }

    var childCoordinators: [AnyCoordinator] { get }

}
