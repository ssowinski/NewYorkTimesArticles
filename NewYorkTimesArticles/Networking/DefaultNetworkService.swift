//
//  DefaultNetworkService.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

class DefaultNetworkService: NetworkService {
    
    private let urlSession : URLSession = URLSession.shared
    private var dataTask: URLSessionDataTask?
    
    func startRequest(_ requestTarget: RequestTargetType, completionHandler: @escaping (HTTPURLResponse?, Data?, Error?) -> Void) {
        
        if dataTask != nil {
            dataTask?.cancel()
        }

        let urlString: String
        if requestTarget.parameterEncoding == .url {
            let urlParameters = NetworkingTools.parametersToString(requestTarget.parameters)
            urlString = "\(requestTarget.path)\(urlParameters)"
        } else {
            urlString = "\(requestTarget.path)"
        }

        guard let url = URL(string: urlString) else {
            //TODO: -completionHandler with error
            return
        }
        
        var request =  URLRequest(url: url)
        request.httpMethod = requestTarget.method.rawValue
        request.allHTTPHeaderFields = requestTarget.headers
        
        if requestTarget.parameterEncoding == .json, let jsonData = requestTarget.parameters?.data {
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData
        }
        
        dataTask = urlSession.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                completionHandler(response as? HTTPURLResponse, data, error)
            }
        }
        
        dataTask?.resume()
    }
    
    func cancel() {
        dataTask?.cancel()
    }
}
