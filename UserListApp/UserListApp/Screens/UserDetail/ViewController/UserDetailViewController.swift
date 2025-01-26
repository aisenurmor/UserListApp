//
//  UserDetailViewController.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

final class UserDetailViewController: UIViewController {
    
    private enum Constants {
        static let gradientViewHeightMultiplier: CGFloat = 0.15
        static let initialAvatarSize: AvatarView.Size = AvatarView.Size.large
        static let horizontalInset: CGFloat = 20
    }
    
    // MARK: UI Components
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.boldSystemFont(ofSize: 28)
        return label
    }()
    
    private let gradientView = UIView()
    private let contentView = UIView()
    private let avatarView = AvatarView()
    private let userInfoListView = UserInfoListView()

    private let viewModel: UserDetailViewModel
    
    // MARK: Initializer
    init(_ viewModel: UserDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

// MARK: - Private Methods
private extension UserDetailViewController {
    
    func setupUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        
        setupGradientView()
        setupHeader()
        setupInfoListView()
    }
    
    func configureViews() {
        avatarView.configure(
            with: viewModel.nameInitials,
            size: Constants.initialAvatarSize,
            backgroundColor: .white,
            textColor: UIColor.blue.withAlphaComponent(0.7),
            borderColor: UIColor.blue.withAlphaComponent(0.7),
            borderWidth: 2
        )
        nameLabel.text = viewModel.name
        userInfoListView.configure(with: viewModel.userInfoList)
    }
    
    func setupGradientView() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.purple.withAlphaComponent(0.3).cgColor,
            UIColor.blue.withAlphaComponent(0.3).cgColor,
            UIColor.white.cgColor
        ]
        gradientLayer.frame = CGRect(
            x: 0, y: 0, width: view.bounds.width, height: view.bounds.height * Constants.gradientViewHeightMultiplier
        )
        gradientView.layer.addSublayer(gradientLayer)
        
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor),
            gradientView.rightAnchor.constraint(equalTo: view.rightAnchor),
            gradientView.heightAnchor.constraint(
                equalTo: view.heightAnchor, multiplier: Constants.gradientViewHeightMultiplier
            )
        ])
    }
    
    func setupHeader() {
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(avatarView)
        
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(
                equalTo: gradientView.bottomAnchor, constant: -(Constants.initialAvatarSize.rawValue / 2)
            ),
            avatarView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalInset)
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 12),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalInset),
            nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.horizontalInset)
        ])
    }
    
    func setupInfoListView() {
        userInfoListView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userInfoListView)
        
        NSLayoutConstraint.activate([
            userInfoListView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 24),
            userInfoListView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.horizontalInset),
            userInfoListView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.horizontalInset)
        ])
    }
}
