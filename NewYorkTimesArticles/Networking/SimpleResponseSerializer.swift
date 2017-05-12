//
//  SimpleResponseSerializer.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct SimpleResponseSerializer: ResponseSerializerType {
    
    func getObject<T: JsonInitializable>(fromData data: Data, forPath path: String) -> T? {
        let rootJson = getJson(data)
        guard let objectNodeJson = rootJson?.value(forPath: path) as? Json else { return nil }
        return T(json: objectNodeJson)
    }
    
    func getObjectsColection<T: JsonInitializable>(fromData data: Data, forPath path: String) -> [T] {
        let rootJson = getJson(data)
        guard let jsonsArray = rootJson?.value(forPath: path) as? Array<Json> else { return [] }
        
        var objects: [T] = []
        for element in jsonsArray {
            if let obj = T(json: element) {
                objects.append(obj)
            }
        }
        return objects
    }
    
    private func getJson(_ data: Data) -> Json? {
        if let serialization = try? JSONSerialization.jsonObject(with: data, options: []), let json = serialization as? Json {
            return json
        } else {
            return nil
        }
    }
}
