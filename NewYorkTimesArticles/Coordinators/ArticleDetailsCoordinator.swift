//
//  ArticleDetailsCoordinator.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 27.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

class ArticlesDetailsCoordinator: Coordinator {
    deinit {
        print("deinit ArticlesDetailsCoordinator")
    }
    
    func start(url: URL?) {
        let articlesDetailsViewModel = ArticlesDetailsViewModel(url: url)
        let articlesDetailsViewController = ArticlesDetailsViewController(viewModel: articlesDetailsViewModel)
        articlesDetailsViewController.delegate = self
        navigationController?.pushViewController(articlesDetailsViewController, animated: true)
    }
    
}

extension ArticlesDetailsCoordinator: ArticlesDetailsViewControllerDelegate {
    
    func didDeinitViewController() {
        parentCoordinator?.removeChildCoordinator(self)
    }
}
