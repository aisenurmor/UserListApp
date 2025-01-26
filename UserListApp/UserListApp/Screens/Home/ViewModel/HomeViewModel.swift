//
//  HomeViewModel.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import Foundation

final class HomeViewModel {
    typealias ChangeHandler = (Change) -> Void
    
    enum Change {
        case reload
        case alert(title: String, message: String)
    }
    
    var changeHandler: ChangeHandler?
    
    private(set) var users: [User] = []
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func viewDidLoad() {
        Task {
            await fetchUsers()
        }
    }
    
    func user(at index: Int) -> User {
        return users[index]
    }
}

// MARK: - Private Methods
private extension HomeViewModel {
    
    func fetchUsers() async {
        do {
            self.users = try await repository.fetch()
            changeHandler?(.reload)
        } catch {
            changeHandler?(.alert(title: "Error", message: "An error was occured."))
        }
    }
}
