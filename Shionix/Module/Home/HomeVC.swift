//
//  ViewController.swift
//  Shionix
//
//  Created by azerty on 17/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit

final class HomeVC: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var nombreLabel: UILabel!
    @IBOutlet private weak var versionLabel: UILabel!
    @IBOutlet private weak var menuView: MenuView!
    
    // MARK:- IBActions
    
    // MARK:- Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = L10n.Home.welcome
        versionLabel.text = AppVersion.version
        
        MyJsonWSClient.getMenu { [weak self] result in
            switch result {
            case let .success(menuItems): self?.menuView.fill(items: menuItems)
            case let .failure(error): print(error.localizedDescription)
            }
        }
    }
}
