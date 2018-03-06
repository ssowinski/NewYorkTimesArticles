//
//  TranslationsKey.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 06.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

enum TKey: String {
    case articlesListTitle = "articles_list_title"
    case articlesDetailsTitle = "articles_details_title"
    case errorAlertTitle = "error_alert_title"
    case invalidAuthenticationAlertMessage = "invalid_authentication_alert_message"
    case outdatedVersionOfAppAlertMessage = "outdated_version_of_app_alert_message"
    case unknownApiErrorAlertMessage = "unknown_api_error_alert_message"
    case notInternetAlertMessage = "not_internet_alert_message"
    case timedOutAlertMessage = "timed_out_alert_message"
}

extension TKey {
    var localized: String {
        return NSLocalizedString(self.rawValue, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
