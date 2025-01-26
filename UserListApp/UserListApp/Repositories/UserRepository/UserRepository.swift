//
//  UserRepository.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

protocol UserRepository {
    
    /// Returns all users
    func fetch() async throws -> [User]
}
