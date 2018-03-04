//
//  ErrorSerializing.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol ErrorSerializing {
    func serializeError(_ error: Error?, statusCode: Int?, data: Data?) -> Error
}
