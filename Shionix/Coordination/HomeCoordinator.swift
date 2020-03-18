//
//  HomeCoordinator.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit

// MARK: - Delegate
protocol HomeCoordinatorDelegate: class {
    func homeCoordinatorDidFinish(_ coordinator: HomeCoordinator)
}

// MARK: - Coordinator

final class HomeCoordinator: CoordinatorNavigable {
    // MARK:- Properties
    weak var delegate: HomeCoordinatorDelegate?
    var childCoordinators: [Coordinator] = []
    var navigator: NavigatorType
    var rootViewController: UINavigationController
    
    // MARK:- Func
    init() {
        let homeVC = StoryboardScene.Home.homeVC.instantiate()
        let navigationController = UINavigationController(rootViewController: homeVC)
        navigationController.navigationBar.isHidden = true
        self.navigator = Navigator(navigationController: navigationController)
        self.rootViewController = navigationController
        self.rootViewController.modalPresentationStyle = .fullScreen
        self.rootViewController.modalTransitionStyle = .crossDissolve
        homeVC.delegate = self
    }
    
    func start() {}
    
    func didTapBack() {
        navigator.popViewController(animated: true)
    }
}

// MARK:- HomeVC Delegate
extension HomeCoordinator: HomeVCDelegate {
    func homeDidTapSearch() {
        let vc = StoryboardScene.Home.searchVC.instantiate()
        vc.delegate = self
        self.navigator.push(vc, animated: true)
    }
}

// MARK:- SearchVC Delegate
extension HomeCoordinator: SearchVCDelegate {}
