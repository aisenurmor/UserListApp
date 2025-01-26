//
//  HomeViewModel.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import Foundation

final class HomeViewModel {
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
}
