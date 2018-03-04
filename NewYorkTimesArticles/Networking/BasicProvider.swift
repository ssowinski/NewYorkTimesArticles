//
//  BasicProvider.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 04.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

class BasicProvider {
    
    var networkService: NetworkService
    var errorSerializer: ErrorSerializing
    var successSerializer: SuccessSerializing
    var headerManager: HeaderManaging
    var networkLogger: NetworkLogging?
    
    init(networkService: NetworkService = DefaultNetworkService(),
         errorSerializer: ErrorSerializing = NYTErrorSerializer(),
         successSerializer: SuccessSerializing = DefaultSuccessSerializer(),
         headerManager: HeaderManaging = DefaultHeaderManager(),
         networkLogger: NetworkLogging? = DefaultNetworkLogger()
        
        ) {
        self.networkService = networkService
        self.errorSerializer = errorSerializer
        self.successSerializer = successSerializer
        self.headerManager = headerManager
        self.networkLogger = networkLogger
    }
}
