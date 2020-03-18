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
    
    // MARK:- IBActions
    
    // MARK:- Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = L10n.Home.welcome
        versionLabel.text = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
}
