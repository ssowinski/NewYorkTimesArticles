//
//  ArticleCellAdapter.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct ArticleCellAdapter {
    let snippet: String
    let pubDate: String
    
    init(article: Article) {
        self.snippet = article.snippet
        self.pubDate = article.pubDate?.iso8601 ?? ""
    }
}
