//
//  NYTError.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 15.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation
//TODO: removed unneeded
enum NYTError: Error {
    case timedOut
    case offline
    case unknown
    case jsonMapping
    case noDataInResponse
    case jsonParsing

    case invalidAuthentication
    case outdatedVersionOfApp
    case unknownApiError
}

extension NYTError: PresentableError {

    var title: String {
        return "error_alert_title".localize
    }
    
    var message: String {
        switch self {
        case .offline: return "not internet"
        case .invalidAuthentication: return "invalid_authentication_alert_message".localize
        case .outdatedVersionOfApp: return "outdated_version_of_app_alert_message".localize
        case .unknownApiError: return "unknown_api_error_alert_message".localize
        default: return ""
        }
    }
    
    var alertType: AlertType {
        switch self {
        case .timedOut:
            return .refresh
        default:
            return .ok
        }
    }
}
