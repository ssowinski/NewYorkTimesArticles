//
//  RequestBuilderType.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol RequestBuilderType {
    func startRequest(requestTarget: RequestTargetType, completionHandler: @escaping (HTTPURLResponse?, Data?, Error?) -> Void)
    func cancel()
}
