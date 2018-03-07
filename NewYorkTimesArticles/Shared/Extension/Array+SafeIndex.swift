//
//  Array+SafeIndex.swift
//  NewYorkTimesArticles
//
//  Created by Slawomir Sowinski on 07.03.2018.
//  Copyright © 2018 Sławomir Sowiński. All rights reserved.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        return Int(index) < count ? self[Int(index)] : nil
    }
}
