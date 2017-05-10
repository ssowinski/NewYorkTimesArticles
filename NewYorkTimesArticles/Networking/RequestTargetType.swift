//
//  RequestTargetType.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 05.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

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

protocol RequestTargetType {
    var URLString: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: Headers? { get }
    var parameterEncoding: ParameterEncoding { get }
}
