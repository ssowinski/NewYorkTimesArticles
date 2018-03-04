//
//  NetworkLogging.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol NetworkLogging {
    func log(_ requestTarget: RequestTargetType, _ response: HTTPURLResponse?, _ data: Data?, _ error: Error?)
}
