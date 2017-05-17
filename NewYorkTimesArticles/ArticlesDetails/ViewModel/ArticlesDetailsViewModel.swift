//
//  ArticlesDetailsViewModel.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 16.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct ArticlesDetailsViewModel {
    
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    var urlToDisplay: String {
        return url?.absoluteString ?? ""
    }

}
