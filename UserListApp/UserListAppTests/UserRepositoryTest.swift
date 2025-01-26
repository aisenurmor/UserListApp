//
//  UserRepositoryTest.swift
//  UserListAppTests
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import XCTest

@testable import UserListApp

final class UserRepositoryTests: XCTestCase {
    
    var mockRepository: MockUserRepository!

    override func setUp() {
        super.setUp()
        mockRepository = MockUserRepository()
    }

    override func tearDown() {
        mockRepository = nil
        super.tearDown()
    }

    func testFetchUsers_Success() async throws {
        let users = try await mockRepository.fetch()

        XCTAssertEqual(users.count, 2)
        XCTAssertEqual(users.first?.name, "Leanne Graham")
    }

    func testFetchUsers_Failure() async {
        mockRepository.shouldReturnError = true
        
        do {
            _ = try await self.mockRepository.fetch()
            XCTFail("Expected error to be thrown, but no error was thrown.", file: #file, line: #line)
        } catch {
            XCTFail("Expected URLError but got \(type(of: error))")
        }
    }
}
