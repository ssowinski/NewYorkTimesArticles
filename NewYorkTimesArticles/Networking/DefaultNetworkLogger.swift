//
//  DefaultNetworkLogger.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct DefaultNetworkLogger: NetworkLogging {
    
    func log(_ requestTarget: RequestTargetType, _ response: HTTPURLResponse?, _ data: Data?, _ error: Error?) {
        
        let url = requestTarget.path
        let method = requestTarget.method
        let headers = requestTarget.headers
        let responseDescription = response?.debugDescription ?? ""
        let parameters = requestTarget.parameters
        let encodeResoponseData = String(data: data ?? Data(), encoding: .utf8) ?? ""
        
        #if DEBUG
            let log = "\(method): \(url)\n parameters:\n\(parameters ?? [:])\n\nheaders:\n\(headers ?? [:]))\n\nresponse:\n\(responseDescription)\n\ndata:\n\(encodeResoponseData)"
            print(log)
        #else
            if let err = error {
                var userInfo: [String: Any] = [:]
                userInfo["method"] = method
                userInfo["url"] = url
                userInfo["parameters"] = parameters
                userInfo["headers"] = headers
                userInfo["response"] = responseDescription
                userInfo["data"] = encodeResoponseData
                CLSUtils.recordError(err, userInfo: userInfo)
            }
        #endif
    }
    
    
}
