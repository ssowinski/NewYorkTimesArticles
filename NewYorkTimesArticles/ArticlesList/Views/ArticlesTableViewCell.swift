//
//  ArticlesTableViewCell.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {
    
    var snippet: String? {
        didSet {
            snippetLabel.text = snippet
        }
    }
    
    var pubDate: String? {
        didSet {
            pubDateLabel.text = pubDate
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureSelf()
        addSubviews()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private let snippetLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 10
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.textColor = UIColor.white
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private let pubDateLabel: UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.numberOfLines = 1
        label.font = UIFont.preferredFont(forTextStyle: .footnote)
        label.textColor = UIColor.red
        label.minimumScaleFactor = 0.5
        return label
    }()
    
    private func configureSelf() {
        backgroundColor = UIColor.gray
        selectionStyle = .none
        accessoryType = .disclosureIndicator
    }
    
    private func addSubviews() {
        contentView.addSubview(snippetLabel)
        contentView.addSubview(pubDateLabel)
    }
    
    private func setupLayout() {
        snippetLabel.translatesAutoresizingMaskIntoConstraints = false
        pubDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            snippetLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            snippetLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
            snippetLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
            snippetLabel.bottomAnchor.constraint(equalTo: pubDateLabel.topAnchor, constant: -10)
            
            ])
        
        NSLayoutConstraint.activate([
            pubDateLabel.leftAnchor.constraint(equalTo: snippetLabel.leftAnchor),
            pubDateLabel.rightAnchor.constraint(equalTo: snippetLabel.rightAnchor),
            pubDateLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
    }
    

    
}
