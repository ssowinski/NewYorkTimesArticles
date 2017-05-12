//
//  String+URL.swift
//  TwitterClient
//
//  Created by Sławomir Sowiński on 05.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

extension String {
    var URLEscapedString: String? {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)
    }
    
    var utf8Encoded: Data {
        return self.data(using: .utf8)!
    }
}
