//
//  Data+Json.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 06.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

extension Data {
    var json: Any? {
        return try? JSONSerialization.jsonObject(with: self, options: [])
    }
}

extension Dictionary where Key == String {
    var data: Data? {
        return try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
    }
}

