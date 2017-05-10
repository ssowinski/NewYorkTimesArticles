//
//  Date+String.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

extension Date {
    static let Iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        //        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX" //data musi byc z timezone, bez timezone system myśli ze to jest UTC i dodaje 2 bo my jesteśmy w Warszawaie
        return formatter
    }()
    
    var iso8601: String {
        return Date.Iso8601Formatter.string(from: self)
    }
}

extension String {
    var dateFromISO8601: Date? {
        return Date.Iso8601Formatter.date(from: self)
    }
}
