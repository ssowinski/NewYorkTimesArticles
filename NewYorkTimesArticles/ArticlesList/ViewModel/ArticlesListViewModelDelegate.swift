//
//  ArticlesListViewModelDelegate.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol ArticlesListViewModelDelegate: class {
    func startActivityIndicator()
    func stopActivityIndicator()
    
    func didFinishFetchingDataWithSuccess()
    func didFinishFetchingDataWithError(_ errorMessage: String)
}
