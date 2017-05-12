//
//  ResponseSerializerType.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol ResponseSerializerType {
    func getObject<T: JsonInitializable>(fromData data: Data, forPath path: String) -> T?
    func getObjectsColection<T: JsonInitializable>(fromData data: Data, forPath path: String) -> [T]
}
