//
//  NetworkingTools.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 12.05.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import Foundation

struct NetworkingTools {
    
    private struct Const {
        static let Separator = "&"
        static let SeparatorMethodAndParameters = "?"
    }
    
    static func parametersToString(_ parameters: Parameters?) -> String {
        
        guard let parameters = parameters else { return "" }
        
        var parArray = [String]()
        
        for (parName, parValue) in parameters {
            
            if let stringParValue = parValue as? String, let encodedValue = stringParValue.URLEscapedString {
                parArray.append("\(parName)=\(encodedValue)")
            }
            
            if let dictParValue = parValue as? Parameters {
                parArray.append("\(parName)=\(parametersToString(dictParValue))")
            }
            
            //TODO: -handle array case
        }
        
        return parArray.isEmpty ? "" : Const.SeparatorMethodAndParameters + parArray.joined(separator: Const.Separator)
    }
    
    
}
