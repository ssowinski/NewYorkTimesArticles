//
//  AppDelegate.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        coordinator = AppCoordinator(navigationController: navigationController, parentCoordinator: nil)
        coordinator?.start()
        
        window?.makeKeyAndVisible()
        return true
    }
}

