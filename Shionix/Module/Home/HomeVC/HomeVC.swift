//
//  ViewController.swift
//  Shionix
//
//  Created by azerty on 17/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit
import Toaster

// MARK:- Delegate
protocol HomeVCDelegate: class {
    func homeDidTapSearch()
}

final class HomeVC: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var nombreLabel: UILabel!
    @IBOutlet private weak var versionLabel: UILabel!
    @IBOutlet private weak var menuView: MenuView!
    
    // MARK:- Properties
    weak var delegate: HomeVCDelegate?
    
    // MARK:- Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = L10n.Home.welcome
        versionLabel.text = AppVersion.version
        nombreLabel.text = L10n.Home.nombre
        
        menuView.delegate = self
        
        showLoader()
        MyJsonWSClient.getMenu { [weak self] result in
            self?.hideLoader()
            switch result {
            case let .success(menuItems): self?.menuView.fill(items: menuItems)
            case let .failure(error): Toast.init(text: error.localizedDescription).show()
            }
        }
    }
}

extension HomeVC: MenuViewDelegate {
    func menuDidSelect(at: IndexPath) {
        switch at.row {
        case 0: delegate?.homeDidTapSearch()
        default: break
        }
    }
}
