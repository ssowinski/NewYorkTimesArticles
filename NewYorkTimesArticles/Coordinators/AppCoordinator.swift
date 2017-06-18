//
//  AppCoordinator.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 27.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    func start() {
        let articleListCoordinator = ArticleListCoordinator(navigationController: navigationController, parentCoordinator: self)
        articleListCoordinator.start()
        addChildCoordinator(articleListCoordinator)
        
        print("AppCoordinator child: \(childCoordinators)")
    }
    
}
