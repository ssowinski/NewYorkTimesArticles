//
//  UITableViewCell+ReusableIdentifier.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 09.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reusableIdentifier: String {
        return String(describing: self)
    }
}
