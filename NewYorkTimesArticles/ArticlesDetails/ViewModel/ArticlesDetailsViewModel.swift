//
//  ArticlesDetailsViewModel.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 16.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol ArticlesDetailsViewModeling {
    var request: URLRequest? { get }
}

struct ArticlesDetailsViewModel {
    
    private let url: URL?
    
    init(url: URL?) {
        self.url = url
    }
    
    var request: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        return URLRequest(url: url)
    }
}
