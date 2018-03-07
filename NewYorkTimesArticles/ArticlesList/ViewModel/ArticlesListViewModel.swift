//
//  ArticlesListViewModel.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

class ArticlesListViewModel: ArticlesListViewModelType {
    
    private var articles: [Article] = []
    private let articleProvider: ArticleProviding
    
    init(articleProvider: ArticleProviding) {
        self.articleProvider  = articleProvider
    }
    
    //MARK: - ArticlesListViewModelType
    weak var delegate: ArticlesListViewModelDelegate?
    
    func fetchArticles() {
        delegate?.startActivityIndicator()
        
        articleProvider.fetchArticles(query: "iphone") { [weak self] (result: Result<[Article]>) in
            self?.delegate?.stopActivityIndicator()
            
            switch result {
            case .success(let articles):
                self?.articles = articles
                self?.delegate?.didFinishFetchingDataWithSuccess()
            case .failure(let error):
                self?.articles = []
                self?.delegate?.didFinishFetchingDataWithError(error: error)
            }
        }
    }
    
    func dataForCell(forIndexPath indexPath: IndexPath) -> ArticleCellAdapter? {
        guard let article = articles[safe: indexPath.row] else { return nil }
        return ArticleCellAdapter(article: article)
    }
    
    var articlesNumber: Int {
        return articles.count
    }
    
    func urlForCell(forIndexPath indexPath: IndexPath) -> URL? {
        return articles[safe: indexPath.row]?.webUrl
    }

}
