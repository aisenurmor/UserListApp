//
//  UserInfoListView.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

final class UserInfoListView: UIView {
    typealias InfoItemDisplay = Display.InfoItem
    
    private enum Constants {
        static let iconHeight: CGFloat = 28
        static let itemSpacing: CGFloat = 8
    }
    
    // MARK: - UI Elements
    private let stackView = UIStackView()
    
    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Configuration
    func configure(with display: Display) {
        configureListItems(display.infoList)
    }
}

// MARK: - Private Methods
private extension UserInfoListView {
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.spacing = Constants.itemSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor)
        ])
    }
    
    func configureListItems(_ infoList: [InfoItemDisplay]) {
        for item in infoList {
            let itemView = createListItem(item.type, value: item.value)
            stackView.addArrangedSubview(itemView)
        }
    }
    
    func createListItem(_ type: Display.InfoType, value: String) -> UIView {
        let itemView = UIView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        
        let iconImageView = UIImageView(image: UIImage(systemName: type.iconName))
        iconImageView.tintColor = .blue.withAlphaComponent(0.5)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        itemView.addSubview(iconImageView)
        
        let titleLabel = UILabel()
        titleLabel.text = type.title
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        itemView.addSubview(titleLabel)
        
        let detailLabel = UILabel()
        detailLabel.text = value
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        itemView.addSubview(detailLabel)
        
        itemView.setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
        
        NSLayoutConstraint.activate([
            iconImageView.topAnchor.constraint(equalTo: itemView.topAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: itemView.bottomAnchor),
            iconImageView.leftAnchor.constraint(equalTo: itemView.leftAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: Constants.iconHeight),
            iconImageView.heightAnchor.constraint(equalToConstant: Constants.iconHeight),
            
            titleLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: Constants.itemSpacing),
            titleLabel.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            titleLabel.topAnchor.constraint(equalTo: itemView.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: itemView.bottomAnchor),
            titleLabel.firstBaselineAnchor.constraint(equalTo: iconImageView.firstBaselineAnchor),
            
            detailLabel.leftAnchor.constraint(equalTo: titleLabel.rightAnchor, constant: Constants.itemSpacing),
            detailLabel.centerYAnchor.constraint(equalTo: itemView.centerYAnchor),
            detailLabel.topAnchor.constraint(equalTo: itemView.topAnchor),
            detailLabel.bottomAnchor.constraint(equalTo: itemView.bottomAnchor),
            detailLabel.firstBaselineAnchor.constraint(equalTo: titleLabel.firstBaselineAnchor),
        ])
        
        return itemView
    }
}
