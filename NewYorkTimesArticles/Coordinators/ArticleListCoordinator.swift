//
//  ArticleListCoordinator.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 27.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

class ArticleListCoordinator: Coordinator {
    func start() {
        let articleProvider = ArticleProvider(requestBuilder: NewYorkTimesRequestBuilder(), responseSerializer: SimpleResponseSerializer())
        let viewModel = ArticlesListViewModel(articleProvider: articleProvider)
        let viewController = ArticleListViewController(viewModel: viewModel)
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
