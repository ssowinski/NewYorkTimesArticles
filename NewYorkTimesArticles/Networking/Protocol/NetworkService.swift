//
//  NetworkService.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol NetworkService {
    func startRequest(_ requestTarget: RequestTargetType, completionHandler: @escaping (HTTPURLResponse?, Data?, Error?) -> Void)
    func cancel()
}
