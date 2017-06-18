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
    
    init(navigationController: UINavigationController?, parentCoordinator: Coordinator?) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
    }
    
    func addChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    func removeChildCoordinator(_ childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
        //        if let index = childCoordinators.index(where: { $0 === childCoordinator }) {
        //            childCoordinators.remove(at: index)
        //        }
    }
}
