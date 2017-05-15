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

class ArticleProvider: ArticleProviding {
    
    private let requestBuilder: RequestBuilderType
    private let responseSerializer: ResponseSerializerType
    
    init(requestBuilder: RequestBuilderType, responseSerializer: ResponseSerializerType) {
        self.requestBuilder = requestBuilder
        self.responseSerializer = responseSerializer
    }
    
    func fetchArticles(completionHandler: @escaping (Result<[Article]>) -> ()) {
        
        let requestTarget = NewYorkTimesRequestTarget.getArticles(query: "kubica", sort: SortType.newest)
        
        requestBuilder.startRequest(requestTarget: requestTarget) {[weak self] (response, data, error) in
            
//                        print("response: \(String(describing: response))")
//                        let ncodeResoponseData = String(data: data ?? Data(), encoding: .utf8) ?? ""
//                        print("data: \(ncodeResoponseData)")
//                        print("error: \(String(describing: error))")
            
            
            if error != nil || response?.statusCode != 200 {
                let nytError = NYTError.serializeError(httpStatusCode: response?.statusCode, data: data, error: error)
                
                DispatchQueue.main.async {
                    completionHandler(.failure(nytError))
                }
                return
            }
            
            if let data = data {
                let fetchedArticle: [Article] = self?.responseSerializer.getObjectsColection(fromData: data, forPath: "response/docs") ?? []
                DispatchQueue.main.async {
                    completionHandler(.success(fetchedArticle))
                }
            } else {
                DispatchQueue.main.async {
                    completionHandler(.success([]))
                }
            }
        }

    }
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
