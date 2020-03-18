//
//  SearchVC.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit

protocol SearchVCDelegate: class {
    func didTapBack()
}

final class SearchVC: UIViewController {
    // MARK:- IBOutlets
    
    // MARK:- Properties
    weak var delegate: SearchVCDelegate?
    
    @IBAction func tapBack(_ sender: Any) {
        delegate?.didTapBack()
    }
    
    // MARK:- Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
