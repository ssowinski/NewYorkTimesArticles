//
//  ErrorPresenting.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 21.07.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

protocol ErrorPresenting {
    func showAlert(_ title: String, message: String)
}

extension ErrorPresenting where Self: UIViewController {
    
    func showAlert(_ title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
