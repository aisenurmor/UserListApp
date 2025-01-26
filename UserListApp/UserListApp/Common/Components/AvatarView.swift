//
//  AvatarView.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

final class AvatarView: UIView {
    
    enum Size: CGFloat {
        case small = 60
        case large = 80
    }
    
    // MARK: - UI Components
    private let avatarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    private let avatarLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        return label
    }()
    
    // MARK: Properties
    private var size: Size = .small
    
    // MARK: Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Configure Methods
    func configure(
        with text: String,
        size: Size = .small,
        backgroundColor: UIColor,
        textColor: UIColor = .white,
        borderColor: UIColor = .clear,
        borderWidth: CGFloat = 0
    ) {
        self.size = size
        
        avatarView.backgroundColor = backgroundColor
        avatarView.layer.cornerRadius = size.rawValue / 2
        avatarView.layer.borderColor = borderColor.cgColor
        avatarView.layer.borderWidth = borderWidth
        avatarLabel.textColor = textColor
        avatarLabel.text = text
        
        setupUI()
    }
    
    func clearView() {
        avatarLabel.text = nil
        avatarView.backgroundColor = nil
    }
}

private extension AvatarView {
    
    func setupUI() {
        avatarView.addSubview(avatarLabel)
        addSubview(avatarView)
        
        NSLayoutConstraint.activate([
            avatarView.widthAnchor.constraint(equalToConstant: size.rawValue),
            avatarView.heightAnchor.constraint(equalToConstant: size.rawValue),
            avatarView.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatarView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarView.topAnchor.constraint(equalTo: topAnchor),
            avatarView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            
            avatarLabel.centerXAnchor.constraint(equalTo: avatarView.centerXAnchor),
            avatarLabel.centerYAnchor.constraint(equalTo: avatarView.centerYAnchor)
        ])
    }
}
