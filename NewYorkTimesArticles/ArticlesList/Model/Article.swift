//
//  Article.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct Article {
    let webUrl: URL?
    let snippet: String
    let pubDate: Date?
    let sectionName: String
    
    fileprivate struct ArticleApiKeys {
        static let webUrl = "web_url"
        static let snippet = "snippet"
        static let pubDate = "pub_date"
        static let sectionName = "section_name"
    }
}

extension Article: JsonInitializable {
    init?(json: Json) {
        webUrl = URL(string: json.stringValue(ArticleApiKeys.webUrl))
        snippet = json.stringValue(ArticleApiKeys.snippet)
        pubDate = json.stringValue(ArticleApiKeys.pubDate).dateFromISO8601
        sectionName = json.stringValue(ArticleApiKeys.sectionName)
    }
}
