//
//  HomeViewModelTests.swift
//  UserListAppTests
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import XCTest
@testable import UserListApp

class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockRepository: MockUserRepository!
    
    override func setUp() {
        super.setUp()
        mockRepository = MockUserRepository()
        viewModel = HomeViewModel(repository: mockRepository)
    }
    
    override func tearDown() {
        viewModel = nil
        mockRepository = nil
        super.tearDown()
    }
    
    func testFetchUsers_Success() {
        let expectation = XCTestExpectation(description: "Should trigger reload after fetching users")
        viewModel.changeHandler = { change in
            if case .reload = change {
                expectation.fulfill()
            }
        }
        
        viewModel.viewDidLoad()
        
        wait(for: [expectation], timeout: 1.0)
        
        // Verify users are loaded
        XCTAssertEqual(viewModel.users.count, 2)
        XCTAssertEqual(viewModel.users[1].name, "Ervin Howell")
    }
    
    func testFetchUsers_Failure() {
        mockRepository.shouldReturnError = true
        
        let expectation = XCTestExpectation(description: "Should trigger alert after failed fetch")
        viewModel.changeHandler = { change in
            if case .alert(let title, let message) = change {
                XCTAssertEqual(title, "Error")
                XCTAssertEqual(message, "An error was occured.")
                expectation.fulfill()
            }
        }
        
        viewModel.viewDidLoad()
        
        wait(for: [expectation], timeout: 1.0)
    }
    
    func testUserAtIndex() {
        mockRepository.shouldReturnError = false
        
        let expectation = XCTestExpectation(description: "Should trigger reload after fetching users")
        viewModel.changeHandler = { change in
            if case .reload = change {
                expectation.fulfill()
            }
        }
        
        viewModel.viewDidLoad()
        
        wait(for: [expectation], timeout: 1.0)
        
        // Test fetching users at index
        let user = viewModel.user(at: 1)
        XCTAssertEqual(user.username, "Antonette")
        XCTAssertEqual(user.email, "Shanna@melissa.tv")
    }
}
