//
//  RequestBuilder.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 05.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol RequestBuilderType {
    func fetchData(requestTarget: RequestTargetType, completionHandler: @escaping (HTTPURLResponse?, Data?, Error?) -> Void)
    func cancel()
}

class BasicRequest {
    private let urlSession : URLSession
    private let sessionConfig : URLSessionConfiguration
    private var dataTask: URLSessionDataTask?
    
    init() {
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        sessionConfig.timeoutIntervalForResource = 30.0
        urlSession = URLSession(configuration: sessionConfig)
    }
    
    func fetchData(requestTarget: RequestTargetType, completionHandler: @escaping (HTTPURLResponse?, Data?, Error?) -> Void) {
        
        sessionConfig.httpAdditionalHeaders = requestTarget.headers
        

        
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
