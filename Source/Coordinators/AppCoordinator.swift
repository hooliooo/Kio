//
//  AppCoordinator.swift
//  Rapid
//
//  Created by Julio Alorro on 5/14/17.
//  
//

/**
 The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
 the AppDelegate and kick off the start of the application.
*/
public protocol AppCoordinator: Coordinator {

    associatedtype RootViewController: UIViewController

    init(window: UIWindow, rootViewController: RootViewController)

    /**
     The UIWindow instance the AppCoordinator manages. Typically the AppDelegate's UIWindow instance
    */
    var window: UIWindow { get }

    /**
     The UIWindow instance's rootViewController
    */
    var viewController: RootViewController { get }
}
