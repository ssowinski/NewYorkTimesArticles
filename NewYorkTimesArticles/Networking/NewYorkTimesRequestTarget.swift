//
//  NewYorkTimesRequestTarget.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

import Foundation

enum SortType: String {
    case oldest = "oldest"
    case newest = "newest"
}

enum NewYorkTimesRequestTarget {
    case getArticles(query: String?, sort: SortType)
}

extension NewYorkTimesRequestTarget: RequestTargetType {
    
    private var apiKey: String {
        return "YOUR-API-KEY"
    }
    
    private var baseUrl: String {
        return "https://api.nytimes.com/svc/search/v2"
    }
    
    private var path: String {
        switch self {
        case .getArticles:
            return "/articlesearch.json"
        }
    }
    
    var URLString: String {
        return baseUrl + path
    }
    
    var method: HTTPMethod {
        switch self {
        case .getArticles:
            return .get
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parameters: Parameters? {
        switch self {
        case .getArticles(let query, let sort):
            var parameters: Parameters = [:]
            parameters["api-key"] = apiKey
            parameters["q"] = query
            parameters["sort"] = sort.rawValue
            return parameters
        }
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getArticles:
            return .url
        }
    }
}
