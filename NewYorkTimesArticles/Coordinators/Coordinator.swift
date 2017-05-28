//
//  Coordinator.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 27.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

/// The Coordinator protocol
protocol CoordinatorProt: class {
    
    /// The services that the coordinator can use
    //var services: Services { get }
    
    /// The array containing any child Coordinators
    var childCoordinators: [Coordinator] { get set }
    
}

extension CoordinatorProt {
    
    /// Add a child coordinator to the parent
    func addChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators.append(childCoordinator)
    }
    
    /// Remove a child coordinator from the parent
    func removeChildCoordinator(childCoordinator: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== childCoordinator }
    }
    
}


class Coordinator {
    var childCoordinators: [Coordinator] = []
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
}
