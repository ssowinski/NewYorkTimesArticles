//
//  ArticlesListViewModelType.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol ArticlesListViewModelType {
    weak var delegate: ArticlesListViewModelDelegate? { get set }
    func fetchArticles()
    var articlesNumber: Int { get }
    func dataForCell(forIndexPath indexPath: IndexPath) -> ArticleCellAdapter?
    func urlForCell(forIndexPath indexPath: IndexPath) -> URL?
}
