//
//  AppLoader.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

struct AppLoader {
    
    private let window: UIWindow
    private let navigationController: UINavigationController
    
    init(
        window: UIWindow = UIWindow(frame: UIScreen.main.bounds),
        navigationController: UINavigationController = UINavigationController()
    ) {
        
        self.window = window
        self.navigationController = navigationController
        
        self.navigationController.navigationBar.backgroundColor = .white
    }
    
    func start() {
        let viewController = HomeViewController(
            viewModel: .init(repository: RemoteUserRepository())
        )
        setRootViewController(viewController)
    }
    
    private func setRootViewController(_ viewController: UIViewController?) {
        window.rootViewController = navigationController
        
        if let viewController = viewController {
            navigationController.pushViewController(viewController, animated: true)
        }
        
        window.makeKeyAndVisible()
    }
}
