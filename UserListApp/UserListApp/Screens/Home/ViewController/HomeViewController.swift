//
//  ViewController.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

final class HomeViewController: BaseViewController {
    
    private let tableView = UITableView()
    
    private let viewModel: HomeViewModel
    
    // MARK: - Initializer
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
        
        setupUI()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK: - Private methods
private extension HomeViewController {
    
    func setupUI() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        tableView.registerReusableCell(UserListTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func bindViewModel() {
        viewModel.changeHandler = { [weak self] change in
            DispatchQueue.main.async {
                self?.applyChange(change)
            }
        }
    }

    func applyChange(_ change: HomeViewModel.Change) {
        switch change {
        case .reload:
            tableView.reloadData()
        case .alert(let title, let message):
            showAlert(with: title, message: message)
        }
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(indexPath, type: UserListTableViewCell.self)
        let user = viewModel.user(at: indexPath.row)
        cell.configure(with: user)
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = viewModel.user(at: indexPath.row)
        let detailVC = UserDetailViewController(.init(with: user))
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
