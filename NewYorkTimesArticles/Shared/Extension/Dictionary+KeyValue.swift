//
//  Dictionary+KeyValue.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 08.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

extension Dictionary where Key == String {
    
    func string(_ key: String) -> String? {
        return self[key] as? String
    }
    
    func stringValue(_ key: String) -> String {
        return self.string(key) ?? ""
    }
    
    func int(_ key: String) -> Int? {
        return self[key] as? Int
    }
    
    func intValue(_ key: String) -> Int {
        return self.int(key) ?? 0
    }
    
    func bool(_ key: String) -> Bool? {
        return self[key] as? Bool
    }
    
    func boolValue(_ key: String) -> Bool {
        return self.bool(key) ?? false
    }
    
    func double(_ key: String) -> Double? {
        return self[key] as? Double
    }
    
    func doubleValue(_ key: String) -> Double? {
        return self.double(key) ?? 0.0
    }

    func dictionaryValue(_ key: String) -> Dictionary? {
        return self[key] as? Dictionary
    }
    
    func arrayObject(_ key: String) -> [Dictionary]? {
        return self[key] as? [Dictionary]
    }
    
    func value(forPath fullPath: String) -> Any? {
        let keysArray = fullPath.components(separatedBy: "/")
        var currentJson: Json? = self
        
        for (index, key) in keysArray.enumerated() {
            if index == keysArray.count - 1 {
                return currentJson?[key]
            } else {
                currentJson = currentJson?.dictionaryValue(key)
            }
        }
        return currentJson
    }

}


func +=<K, V> (left: inout [K : V], right: [K : V]) {
    for (k, v) in right {
        left[k] = v
    }
}
