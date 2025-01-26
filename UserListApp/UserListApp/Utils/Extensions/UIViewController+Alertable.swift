//
//  UIViewController+Alertable.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

protocol Alertable { }

typealias AlertActions = (_ alertController: UIAlertController) -> Void

extension Alertable where Self: UIViewController {
    
    func showAlert(with title: String,
                   message: String,
                   actions: AlertActions? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if let actions = actions {
            actions(alertController)
        } else {
            alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                alertController.dismiss(animated: true, completion: nil)
            }))
        }
        present(alertController, animated: true, completion: nil)
    }
}
