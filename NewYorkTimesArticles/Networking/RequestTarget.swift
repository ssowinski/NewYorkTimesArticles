//
//  RequestTarget.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 08.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

enum RequestTarget {
    case getArticles(query: String?)
}

extension RequestTarget: RequestTargetType {
    
    private var apiKey: String {
        return "your-api-key"
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
    
    var parameters: Parameters? {
        switch self {
        case .getArticles(let query):
            var qs: Parameters = [:]
            qs["api-key"] = apiKey
            qs["q"] = query
            return ["qs": qs]
        }
    }
    
    var headers: Headers? {
        return nil
    }
    
    var parameterEncoding: ParameterEncoding {
        switch self {
        case .getArticles:
            return .url
        }
    }
}
