//
//  ArticlesDetailsViewController.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 16.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation
import UIKit

class ArticlesDetailsViewController: UIViewController {
    
    private let viewModel: ArticlesDetailsViewModel
    
    init(viewModel: ArticlesDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate var articlesDetailsView: ArticlesDetailsView? {
        return view as? ArticlesDetailsView
    }
    
    override func loadView() {
        self.view = ArticlesDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSelf()
        setLabel()
    }
    
    private func configureSelf() {
        navigationItem.title = "articles_details_title".localize
    }

    private func setLabel() {
        articlesDetailsView?.urlLabel.text = viewModel.urlToDisplay
    }
    
    
}
