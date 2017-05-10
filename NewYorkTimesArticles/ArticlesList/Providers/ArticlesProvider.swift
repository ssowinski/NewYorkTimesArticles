//
//  ArticlesProvider.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol ArticleProviding {
    func fetchArticles(completionHandler: @escaping (Result<[Article]>) -> ())
}

class FakeArticleProvider: ArticleProviding {
    
    func fetchArticles(completionHandler: @escaping (Result<[Article]>) -> ()) {
        let articles: [Article] = [
            Article(webUrl: URL(string: "https://www.nytimes.com/reuters/2017/05/09/business/09reuters-volkswagen-emissions-hermes.html"), snippet: "Investment advisory firm Hermes EOS has urged Volkswagen shareholders not to clear the carmaker's management and supervisory boards from responsibility for actions taken in 2016, citing VW's failure to resolve long-standing corporate governance an...", pubDate: "2017-05-09T09:03:30+0000".dateFromISO8601, sectionName: "Business Day"),
            Article(webUrl: URL(string: "https://www.nytimes.com/reuters/2017/05/09/business/09reuters-britain-boe-payments.html"), snippet: "The Bank of England said on Tuesday it will set out plans by the middle of this year to widen access to Britain's interbank payment system, part of efforts to boost the country's financial infrastructure over the next few years....", pubDate: "2017-05-09T09:00:40+0000".dateFromISO8601, sectionName: "Business Day")
        ]
        
        delay(1.0) { 
            completionHandler(.success(articles))
        }
    }
    
    
}
