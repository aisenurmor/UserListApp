//
//  UserListTableViewCell.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

final class UserListTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let insets = UIEdgeInsets(top: 8, left: 16, bottom: -8, right: -16)
    }
    
    // MARK: UI Elements
    private let itemView = UserListItemView()
    
    // MARK: Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Functions
    override func prepareForReuse() {
        super.prepareForReuse()
        itemView.clearView()
    }
    
    // MARK: - Cell Configuration
    func configure(with user: User) {
        itemView.configure(with: .init(user))
    }
}

// MARK: - Setup Methods
private extension UserListTableViewCell {
    
    func setupViews() {
        itemView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(itemView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            itemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.insets.left),
            itemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: Constants.insets.right),
            itemView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.insets.top),
            itemView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.insets.bottom)
        ])
    }
}
