//
//  Endpoints.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

enum Endpoint {
    case users
    
    var path: String {
        return switch self {
        case .users:
            "users"
        }
    }
}
