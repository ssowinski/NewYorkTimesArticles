//
//  DefaultHeaderManager.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 04.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct DefaultHeaderManager: HeaderManaging {

    private struct HeaderFields {
        static let platform: String = "X-OKS-Platform"
    }
    
    let platformHeaders: Headers = [HeaderFields.platform: "iOS"]
}
