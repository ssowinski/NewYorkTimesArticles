//
//  JsonInitializable.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 11.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

protocol JsonInitializable {
    init?(json: Json)
}
