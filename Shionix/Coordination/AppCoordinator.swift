//
//  AppCoordinator.swift
//  Newspaper
//
//  Created by azerty on 04/10/2019.
//  Copyright © 2019 azerty. All rights reserved.
//

import UIKit

/** The application's root `Coordinator`. */
final class AppCoordinator: CoordinatorPresentable {
    
    var childCoordinators: [Coordinator] = []
    var rootViewController = UIViewController()
    
    init(window: UIWindow) {
        self.rootViewController.view.backgroundColor = .white
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let coordinator = HomeCoordinator()
        coordinator.delegate = self
        presentCoordinator(coordinator, animated: false)
        coordinator.start()
    }
}


// MARK: - Home Coordinator Delegate
extension AppCoordinator: HomeCoordinatorDelegate {
    func homeCoordinatorDidFinish(_ coordinator: HomeCoordinator) {
        
    }
}
