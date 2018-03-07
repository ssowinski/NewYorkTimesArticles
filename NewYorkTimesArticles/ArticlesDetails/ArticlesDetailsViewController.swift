//
//  ArticlesDetailsViewController.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 16.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit
import WebKit

protocol ArticlesDetailsViewControllerDelegate: class {
    func didDeinitViewController()
}

class ArticlesDetailsViewController: UIViewController {
    
    weak var delegate: ArticlesDetailsViewControllerDelegate?
    
    deinit {
        print("deinit ArticlesDetailsViewController")
        webViewObservation?.invalidate()
        delegate?.didDeinitViewController()
    }
    
    private let viewModel: ArticlesDetailsViewModel
    
    init(viewModel: ArticlesDetailsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var articlesDetailsView: ArticlesDetailsView {
        return view as! ArticlesDetailsView
    }
    
    override func loadView() {
        self.view = ArticlesDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSelf()
        observeWebViewsLoadingProperty()
        loadWebPage()
    }
    
    private func configureSelf() {
        navigationItem.title = TKey.articlesDetailsTitle.localized
        //articlesDetailsView.webView.uiDelegate = self
    }

    private var webViewObservation: NSKeyValueObservation?

    private func observeWebViewsLoadingProperty() {
        webViewObservation = articlesDetailsView.webView.observe(\.loading, options:.new) {[weak self] wv,ch in
            if let val = ch.newValue {
                if val {
                    self?.articlesDetailsView.activityIndicator.startAnimating()
                } else {
                    self?.articlesDetailsView.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    private func loadWebPage() {
        if let request = viewModel.request {
            articlesDetailsView.webView.load(request)
        }
    }
}

//extension ArticlesDetailsViewController: WKUIDelegate { }

