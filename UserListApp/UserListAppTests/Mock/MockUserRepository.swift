//
//  MockUserRepository.swift
//  UserListAppTests
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import Foundation

@testable import UserListApp

final class MockUserRepository: UserRepository {
    
    var shouldReturnError = false
    var mockUsers: [User] = []

    func fetch() async throws -> [User] {
        if shouldReturnError {
            throw URLError(.badServerResponse)
        }
        return [
            User(
                id: 1,
                name: "Leanne Graham",
                username: "Bret",
                email: "incere@april.biz",
                address: .init(
                    street: "Kulas Light",
                    suite: "Apt. 556",
                    city: "Gwenborough",
                    zipcode: "92998-3874",
                    geo: .init(lat: "-37.3159", lng: "81.1496")
                ),
                phone: "1-770-736-8031 x56442",
                website: "hildegard.org",
                company: .init(
                    name: "Romaguera-Crona",
                    catchPhrase: "Multi-layered client-server neural-net",
                    bs: "harness real-time e-markets"
                )
            ),
            User(
                id: 2,
                name: "Ervin Howell",
                username: "Antonette",
                email: "Shanna@melissa.tv",
                address: .init(
                    street: "Kulas Light",
                    suite: "Apt. 556",
                    city: "Gwenborough",
                    zipcode: "92998-3874",
                    geo: .init(lat: "-37.3159", lng: "81.1496")
                ),
                phone: "1-770-736-8031 x56442",
                website: "hildegard.org",
                company: .init(
                    name: "Romaguera-Crona",
                    catchPhrase: "Multi-layered client-server neural-net",
                    bs: "harness real-time e-markets"
                )
            )
        ]
    }
}
