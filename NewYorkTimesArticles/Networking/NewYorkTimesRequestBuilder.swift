//
//  NewYorkTimesRequestBuilder.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

class NewYorkTimesRequestBuilder: RequestBuilderType {
    
    private let urlSession : URLSession
    private let sessionConfig : URLSessionConfiguration
    private var dataTask: URLSessionDataTask?
    
    init() {
        sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        sessionConfig.timeoutIntervalForResource = 30.0
        urlSession = URLSession(configuration: sessionConfig)
    }
    
    func startRequest(requestTarget: RequestTargetType, completionHandler: @escaping (HTTPURLResponse?, Data?, Error?) -> Void) {
        
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        sessionConfig.httpAdditionalHeaders = requestTarget.headers
        
        let stringParameters = NetworkingTools.parametersToString(requestTarget.parameters)
        
        guard let url = URL(string: "\(requestTarget.URLString)\(stringParameters)") else {
            //TODO: -completionHandler with error
            return
        }
        
        dataTask = urlSession.dataTask(with: url) { data, response, error in
            completionHandler(response as? HTTPURLResponse, data, error)
        }
        
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
