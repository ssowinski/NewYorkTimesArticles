//
//  ArticlesListView.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

class ArticlesListView: UIView {
    
    // MARK: -Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
        configureTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Properties
    let tableView = UITableView()
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
    let refreshControl: UIRefreshControl = UIRefreshControl()
    
    
    // MARK: -Private functions
    private func addSubviews() {
        self.addSubview(tableView)
        tableView.addSubview(refreshControl)
        self.addSubview(activityIndicator)
    }
    
    private func configureTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .darkGray
        tableView.register(ArticlesTableViewCell.self, forCellReuseIdentifier: ArticlesTableViewCell.reusableIdentifier)
        tableView.estimatedRowHeight = 100.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func setupLayout() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
    }
}

