//
//  AppCoordinator.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//  
//

import UIKit

/**
 The AppCoordinator is the highest Coordinator within an application whose primary purpose is to set up the window instance from
 the AppDelegate and kick off the start of the application.
*/
public protocol AppCoordinator: Coordinator {

    associatedtype RootViewController: UIViewController

    init(window: UIWindow, rootViewController: RootViewController)

    var window: UIWindow { get }

    var viewController: RootViewController { get }
}
