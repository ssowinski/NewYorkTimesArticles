//
//  ArticleListViewController.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

protocol ArticleListViewControllerDelegate: class {
    func didSelectArticle(_ url: URL)
}

class ArticleListViewController: UIViewController, AlertPresenting {
    
    weak var delegate: ArticleListViewControllerDelegate?
    
    private var viewModel: ArticlesListViewModelType
    
    init(viewModel: ArticlesListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var articlesLisitView: ArticlesListView {
        return view as! ArticlesListView
    }
    
    override func loadView() {
        self.view = ArticlesListView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSelf()
        fetchArticles()
    }
    
    private func configureSelf() {
        articlesLisitView.tableView.dataSource = self
        articlesLisitView.tableView.delegate = self
        articlesLisitView.refreshControl.addTarget(self, action: #selector(fetchArticles), for: .valueChanged)
        navigationItem.title = TKey.articlesListTitle.localized
        
    }
    
    @objc func fetchArticles() {
        viewModel.fetchArticles()
        articlesLisitView.refreshControl.endRefreshing()
    }
}

extension ArticleListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articlesNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticlesTableViewCell.reusableIdentifier, for: indexPath)
        
        if let articleCell = cell as? ArticlesTableViewCell {
            let articleCellAdapter = viewModel.dataForCell(forIndexPath: indexPath)
            
            articleCell.snippet = articleCellAdapter?.snippet
            articleCell.pubDate = articleCellAdapter?.pubDate
        }
        return cell
    }
}

extension ArticleListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let url = viewModel.urlForCell(forIndexPath: indexPath) {
            
            delegate?.didSelectArticle(url)
        }
    }
}

extension ArticleListViewController: ArticlesListViewModelDelegate {
    func stopActivityIndicator() {
        articlesLisitView.activityIndicator.stopAnimating()
        articlesLisitView.refreshControl.endRefreshing()
    }
    
    func startActivityIndicator() {
        articlesLisitView.activityIndicator.startAnimating()
    }
    
    func didFinishFetchingDataWithSuccess() {
        articlesLisitView.tableView.reloadData()
    }
    
    func didFinishFetchingDataWithError(error: Error) {
        articlesLisitView.tableView.reloadData()
        showError(error: error, refreshAction: nil)
    }
}
