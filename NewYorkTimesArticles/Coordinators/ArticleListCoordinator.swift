//
//  ArticleListCoordinator.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 27.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

class ArticleListCoordinator: Coordinator {
    
    deinit {
        print("deinit ArticleListCoordinator")
    }
    
    func start() {
        let articleProvider = ArticleProvider(requestBuilder: NewYorkTimesRequestBuilder(), responseSerializer: SimpleResponseSerializer())
        let viewModel = ArticlesListViewModel(articleProvider: articleProvider)
        let viewController = ArticleListViewController(viewModel: viewModel)
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
}

extension ArticleListCoordinator: ArticleListViewControllerDelegate {
    
    func didSelectArticle(_ url: URL) {
        let articlesDetailsCoordinator = ArticlesDetailsCoordinator(navigationController: navigationController, parentCoordinator: self)
        articlesDetailsCoordinator.start(url: url)
        addChildCoordinator(articlesDetailsCoordinator)
        print("ArticleListCoordinator child: \(childCoordinators)")
    }
}
