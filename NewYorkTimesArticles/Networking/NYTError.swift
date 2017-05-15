//
//  NYTError.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 15.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

enum NYTError: Error {
    
    case invalidAuthentication
    case outdatedVersionOfApp
    case unknownApiError
}

extension NYTError {
    
    var alertTitle: String {
        return "error_alert_title".localize
    }
    
    var alertMessage: String {
        switch self {
        case .invalidAuthentication: return "invalid_authentication_alert_message".localize
        case .outdatedVersionOfApp: return "outdated_version_of_app_alert_message".localize
        case .unknownApiError: return "unknown_api_error_alert_message".localize
        }
    }
}


extension NYTError {
    
    private static func fromStatusCode(_ httpStatusCode: Int) -> NYTError? {
        switch httpStatusCode {
        case 426: return .outdatedVersionOfApp
        default:    return nil
        }
    }
    
    private static func fromData(_ data: Data) -> NYTError {
        guard let serialization = try? JSONSerialization.jsonObject(with: data, options: []), let json = serialization as? Json else {
            return .unknownApiError
        }
        
        switch json.stringValue("message") {
        case "Invalid authentication credentials" : return .invalidAuthentication
        default: return .unknownApiError //.unknownApiErrorFromJson(message: json["message"].stringValue)
        }
    }
    
    static func serializeError(httpStatusCode: Int?,  data: Data?, error: Error?) -> NYTError {
        
        if let httpStatusCode = httpStatusCode, let errorFormHttpStatusCode = NYTError.fromStatusCode(httpStatusCode) {
            return errorFormHttpStatusCode
        }
        
        if let data  = data {
            return fromData(data)
        }
        
        return NYTError.unknownApiError
    }
}
