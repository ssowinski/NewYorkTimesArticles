//
//  AlertPresenting.swift
//  NewYorkTimesArticles
//
//  Created by Sławomir Sowiński on 21.07.2017.
//  Copyright © 2017 Sławomir Sowiński. All rights reserved.
//

import UIKit

protocol AlertPresenting {
    func showAlert(_ title: String, message: String, action: Action?)
    func showError(error: Error, refreshAction: Action?)
}

extension AlertPresenting where Self: UIViewController {
    
    func showError(error: Error, refreshAction: Action?) {
        guard let error = error as? PresentableError else { return }
        
        switch error.alertType {
        case .ok:
            showAlert(error.title, message: error.message, action: nil)
            
        case .refresh where refreshAction == nil:
            showAlert(error.title, message: error.message, action: nil)
            
        case .refresh where refreshAction != nil:
            showRefreshAlert(error.title, message: error.message, refreshAction: {
                refreshAction?()
            })

        default:
            break
        }
    }
    
    func showAlert(_ title: String, message: String, action: Action?) {
        let alertController = okAlertController(title, message: message) {
            action?()
        }
        present(alertController, animated: true, completion: nil)
    }
    
    private func showRefreshAlert(_ title: String, message: String, refreshAction: Action?) {
        let alertController = refresAlertController(title, message: message, refreshAction: {
            refreshAction?()
        })
        present(alertController, animated: true, completion: nil)
    }
    
    private func okAlertController(_ title: String, message: String, action: Action?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (alertAction) in
            action?()
        }
        alertController.addAction(okAction)
        return alertController
    }
    
    private func refresAlertController(_ title: String, message: String, refreshAction: Action?) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let refreshAlertAction = UIAlertAction(title: "Refresh", style: .default) { (alertAction) in
            refreshAction?()
        }
        alertController.addAction(okAction)
        alertController.addAction(refreshAlertAction)
        return alertController
    }
}
