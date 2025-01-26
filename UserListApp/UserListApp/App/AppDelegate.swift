//
//  AppDelegate.swift
//  UserListApp
//
//  Created by Aise Nur Mor on 26.01.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private lazy var loader = AppLoader()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        loader = AppLoader()
        loader.start()
        
        return true
    }
}

