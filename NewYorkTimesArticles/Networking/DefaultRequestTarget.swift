//
//  DefaultRequestTarget.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct BaseUrl {
    static var value: String {
        #if DEBUG
            return "https://api.nytimes.com/svc/search/v2"
        #else
            return "https://api.nytimes.com/svc/search/v2"
        #endif
    }
}

struct DefaultRequestTarget: RequestTargetType {    
    let path: String
    let method: HTTPMethod
    var headers: Headers?
    let parameters: Parameters?
    let parameterEncoding: ParameterEncoding
    
    let nestedObjPath: String?
}

extension DefaultRequestTarget {
    
    init(_ method: HTTPMethod, _ endpoint: String, _ headers: Headers? = nil, _ parameters: Parameters? = nil, _ parameterEncoding: ParameterEncoding, _ nestedObjPath: String? = nil) {
        self.path = BaseUrl.value + endpoint
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        self.nestedObjPath = nestedObjPath
    }
}
