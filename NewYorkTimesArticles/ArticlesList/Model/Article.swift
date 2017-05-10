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
    
    private struct ArticleApiKeys {
        static let webUrl = "web_url"
        static let snippet = "snippet"
        static let pubDate = "pub_date"
        static let sectionName = "section_name"
    }
}
