//
//  DefaultSuccessSerializer.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct DefaultSuccessSerializer: SuccessSerializing {

    func toObject<T: JsonInitializable>(fromData data: Data?, nestedObjPath path: String?) -> T? {
        
        guard let data = data, let rootJson = data.json as? Json else { return nil }
        
        if let path = path, !path.isEmpty {
            guard let nestedNodeJson = rootJson.value(forPath: path) as? Json else { return nil }
            return T(json: nestedNodeJson)
        } else {
            return T(json: rootJson)
        }
    }
    
    func toObjectsColection<T: JsonInitializable>(fromData data: Data?, nestedObjPath path: String?) -> [T] {
        guard let data = data else { return [] }
        
        var tmpJsonArray: [Json] = []
        
        if let path = path, !path.isEmpty {
            guard let rootJson = data.json as? Json, let nestedJsonsArray = rootJson.value(forPath: path) as? Array<Json> else { return [] }
            tmpJsonArray = nestedJsonsArray
            
        } else {
            guard let rootJsonArray = data.json as? Array<Json> else { return [] }
            tmpJsonArray = rootJsonArray
        }
        
        var objects: [T] = []
        tmpJsonArray.forEach {
            if let obj = T(json: $0) {
                objects.append(obj)
            }
        }
        return objects
    }
}
