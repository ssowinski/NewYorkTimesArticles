//
//  NYTRouter.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

enum NYTRouter {
    case getArticles(query: String?, sort: SortType)
}

extension NYTRouter {
    
    var requestTarget: RequestTargetType {
        
        switch self {
        case .getArticles(let query, let sort):
            var parameters: Parameters = [:]
            parameters["api-key"] = NYTRouterConst.apiKey
            parameters["q"] = query
            parameters["sort"] = sort.rawValue
            return DefaultRequestTarget(.get, "/articlesearch.json", nil, parameters, .url, "response/docs")
        }
    }
}

struct NYTRouterConst {
    static let apiKey: String = "API-KEY"
}
