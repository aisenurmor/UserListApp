//
//  RemoteUserRepository.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

struct RemoteUserRepository: UserRepository {
    
    func fetch() async throws -> [User] {
        let requestBuilder = ApiRequestBuilder(endpoint: .users, httpMethod: .get)
        
        do {
            let users = try await NetworkManager.shared.performRequest(with: requestBuilder, decodingType: [User].self)
            return users
        } catch {
            throw error
        }
    }
}
