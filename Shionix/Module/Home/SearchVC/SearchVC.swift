//
//  SearchVC.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit
import Toaster

protocol SearchVCDelegate: class {
    func didTapBack()
}

final class SearchVC: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK:- Properties
    weak var delegate: SearchVCDelegate?
    private var source = [SearchResult]()
    
    @IBAction func tapBack(_ sender: Any) {
        delegate?.didTapBack()
    }
    
    // MARK:- Funcs
    override func viewDidLoad() {
        super.viewDidLoad()
        // TableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: SearchTVC.self)
        
        // Search bar
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
    }
}

// MARK:- UITableView Delegate & DataSource
extension SearchVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as SearchTVC
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
}

extension SearchVC: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        IonixWSClient.search(rut: searchText) { [weak self] result in
            self?.hideLoader()
            switch result {
            case .success(let result): print(result)
            case .failure(let error): Toast.init(text: error.localizedDescription).show()
            }
        }
    }
}
