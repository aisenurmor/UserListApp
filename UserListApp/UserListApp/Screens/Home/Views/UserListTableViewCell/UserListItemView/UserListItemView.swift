//
//  UserListItemView.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

extension UserListTableViewCell {
    
    final class UserListItemView: UIView {
        
        // MARK: - UI Components
        private let userInfoView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            label.textColor = .black
            return label
        }()
        
        private let phoneLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 12)
            label.textColor = .gray
            return label
        }()
        
        private let companyLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .black
            label.textAlignment = .right
            label.numberOfLines = 0
            return label
        }()
        
        private let avatarView = AvatarView()
        
        // MARK: - Initialize
        override init(frame: CGRect) {
            super.init(frame: frame)
            
            setupViews()
            setupConstraints()
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Cell Configuration
        func configure(with display: Display) {
            avatarView.configure(with: display.initial, backgroundColor: display.backgroundColor)
            
            nameLabel.text = display.name
            phoneLabel.text = display.phone
            companyLabel.text = display.companyName
        }
        
        func clearView() {
            avatarView.clearView()
            nameLabel.text = nil
            phoneLabel.text = nil
            companyLabel.text = nil
        }
    }
}

// MARK: - Private Methods
private extension UserListTableViewCell.UserListItemView {
    
    // MARK: - Setup Methods
    private func setupViews() {
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(avatarView)
        
        userInfoView.addSubview(nameLabel)
        userInfoView.addSubview(phoneLabel)
        
        addSubview(userInfoView)
        addSubview(companyLabel)
        
        nameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        phoneLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        companyLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.topAnchor.constraint(equalTo: topAnchor),
            avatarView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            avatarView.heightAnchor.constraint(equalToConstant: AvatarView.Size.small.rawValue),
            avatarView.widthAnchor.constraint(equalToConstant: AvatarView.Size.small.rawValue),
            
            userInfoView.leadingAnchor.constraint(equalTo: avatarView.trailingAnchor, constant: 8),
            userInfoView.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor),
            userInfoView.trailingAnchor.constraint(lessThanOrEqualTo: companyLabel.leadingAnchor, constant: -8),
            userInfoView.topAnchor.constraint(greaterThanOrEqualTo: nameLabel.topAnchor),
            userInfoView.bottomAnchor.constraint(equalTo: phoneLabel.bottomAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: userInfoView.topAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor),
            
            phoneLabel.leadingAnchor.constraint(equalTo: userInfoView.leadingAnchor),
            phoneLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            phoneLabel.trailingAnchor.constraint(equalTo: userInfoView.trailingAnchor),
            phoneLabel.bottomAnchor.constraint(equalTo: userInfoView.bottomAnchor),
            
            companyLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            companyLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            companyLabel.leadingAnchor.constraint(greaterThanOrEqualTo: userInfoView.trailingAnchor)
        ])
    }
}
