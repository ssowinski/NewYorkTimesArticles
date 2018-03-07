//
//  RequestTargetType.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 05.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol RequestTargetType {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: Headers? { get set }
    var parameters: Parameters? { get }
    var parameterEncoding: ParameterEncoding { get }
    
    var nestedObjPath: String? { get }
}

extension RequestTargetType {
    mutating func addHeaders(_ headers: Headers) {
        self.headers = self.headers + headers
    }
}

enum HTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
}

enum ParameterEncoding {
    case url
    case json
}
