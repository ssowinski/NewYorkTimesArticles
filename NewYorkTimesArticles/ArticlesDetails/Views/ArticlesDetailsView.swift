//
//  ArticlesDetailsView.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 16.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

class ArticlesDetailsView: UIView {
    
    // MARK: -Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: -Properties
    let urlLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 10
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor.blue
        return label
    }()
    
    
    // MARK: -Private functions
    private func addSubviews() {
        self.backgroundColor = UIColor.white
        self.addSubview(urlLabel)
    }
    
    private func setupLayout() {
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            //urlLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            urlLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            urlLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            urlLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10)
            ])
    }
}
