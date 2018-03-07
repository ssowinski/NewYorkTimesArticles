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
}

extension Article: JsonInitializable {
    init?(json: Json) {
        webUrl = URL(string: json.stringValue("web_url"))
        snippet = json.stringValue("snippet")
        pubDate = json.stringValue("pub_date").dateFromISO8601
        sectionName = json.stringValue("section_name")
    }
}
