//
//  NYTErrorSerializer.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 03.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct NYTErrorSerializer: ErrorSerializing {
    func serializeError(_ error: Error?, statusCode: Int?, data: Data?) -> Error {
        
        if error?._code == NSURLErrorTimedOut {
            return NYTError.timedOut
        }
        
        if error?._code == NSURLErrorNotConnectedToInternet {
            return NYTError.offline
        }
        
        if let statusCode = statusCode, let errorFormHttpStatusCode = fromStatusCode(statusCode) {
            return errorFormHttpStatusCode
        }
        
        if let data  = data {
            return fromData(data)
        }
        
        return NYTError.unknownApiError
    }
    
    private func fromStatusCode(_ httpStatusCode: Int) -> NYTError? {
        switch httpStatusCode {
        case 426: return .outdatedVersionOfApp
        default:    return nil
        }
    }
    
    private func fromData(_ data: Data) -> NYTError {
        guard let json = data.json as? Json else {
            return .unknownApiError
        }
        
        switch json.stringValue("message") {
        case "Invalid authentication credentials" : return .invalidAuthentication
        default: return .unknownApiError //.unknownApiErrorFromJson(message: json["message"].stringValue)
        }
    }
}
