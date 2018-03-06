//
//  NYTError.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 15.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

enum NYTError: Error {
    case timedOut
    case offline

    case invalidAuthentication
    case outdatedVersionOfApp
    case unknownApiError
}

extension NYTError: PresentableError {

    var title: String {
        return TKey.errorAlertTitle.localized
    }
    
    var message: String {
        switch self {
        case .offline: return TKey.notInternetAlertMessage.localized
        case .timedOut: return TKey.timedOutAlertMessage.localized
        case .invalidAuthentication: return TKey.invalidAuthenticationAlertMessage.localized
        case .outdatedVersionOfApp: return TKey.outdatedVersionOfAppAlertMessage.localized
        case .unknownApiError: return TKey.unknownApiErrorAlertMessage.localized
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
