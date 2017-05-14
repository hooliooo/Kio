//
//  AppCoordinator.swift
//  JAShorthand
//
//  Created by Julio Alorro on 5/14/17.
//  
//

import UIKit

public protocol AppCoordinator: Coordinator {

    init<RootViewController: UIViewController>(window: UIWindow, rootViewController: RootViewController)

}
