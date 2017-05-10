//
//  Result.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 04.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Result {
    var successValue: T? {
        switch self {
        case .success(let value): return value
        default: return nil
        }
    }
    
    var errorValue: Error? {
        switch self {
        case .failure(let error): return error
        default: return nil
        }
    }
}
