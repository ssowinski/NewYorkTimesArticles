//
//  SuccesSerializing.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol SuccessSerializing {
    func toObject<T: JsonInitializable>(fromData data: Data?, nestedObjPath path: String?) -> T?
    func toObjectsColection<T: JsonInitializable>(fromData data: Data?, nestedObjPath path: String?) -> [T]
}
