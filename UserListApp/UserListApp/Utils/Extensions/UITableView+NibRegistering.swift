//
//  UITableView+NibRegistering.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

extension UITableView {
    
    // Registers a nib object containing a cell.
    ///
    /// - Parameter type: The meta type of cell.
    func registerReusableCell<T: UITableViewCell>(_ type: T.Type) {
        let description = String(describing: type)
        register(type, forCellReuseIdentifier: description)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(_ indexPath: IndexPath, type: T.Type = T.self) -> T {
        let description = String(describing: type)
        if let cell = dequeueReusableCell(withIdentifier: description, for: indexPath) as? T {
            return cell
        }
        fatalError("Failed to dequeue a cell with identifier \(description) matching type \(type.self).")
    }
}
