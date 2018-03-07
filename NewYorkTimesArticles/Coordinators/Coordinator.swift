//
//  Coordinator.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 27.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

class Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    weak var parentCoordinator: Coordinator?
    weak var navigationController: UINavigationController?
    weak var presentingViewController: UIViewController?
    weak var tabBarController: UITabBarController?

    init(navigationController: UINavigationController?, parentCoordinator: Coordinator?, presentingViewController: UIViewController? = nil, tabBarController: UITabBarController? = nil) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        self.presentingViewController = presentingViewController
        self.tabBarController = tabBarController
    }
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
}

extension Coordinator {
    
    func dismissAndRemove() {
        self.presentingViewController?.dismiss(animated: true, completion: {
            self.parentCoordinator?.removeChildCoordinator(self)
        })
    }
}
