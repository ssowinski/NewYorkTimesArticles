//
//  PresentableError.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 04.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol PresentableError {
    var title: String { get }
    var message: String { get }
    var alertType: AlertType { get }
}

enum AlertType {
    case ok
    case refresh
    case settings
    case updateApp
}

