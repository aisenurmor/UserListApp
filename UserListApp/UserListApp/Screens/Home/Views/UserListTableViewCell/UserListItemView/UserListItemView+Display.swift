//
//  UserListItemView+Display.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

extension UserListTableViewCell.UserListItemView {
    
    private enum Constants {
        static let colors = [
            UIColor(.purple), 
            UIColor(.blue),
            UIColor(.orange), 
            UIColor(.yellow)
        ]
    }
    
    struct Display {
        let initial: String
        let name: String
        let phone: String
        let companyName: String
        let backgroundColor: UIColor
        
        init(_ user: User) {
            self.initial = user.name.prefix(1).uppercased()
            self.name = user.name
            self.phone = user.phone
            self.companyName = user.company.name
            self.backgroundColor = Constants.colors[user.id % Constants.colors.count]
        }
    }
}
