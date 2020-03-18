//
//  SearchVC.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit
import Toaster
import IDZSwiftCommonCrypto

protocol SearchVCDelegate: class {
    func didTapBack()
}

final class SearchVC: UIViewController {
    // MARK:- IBOutlets
    @IBOutlet private weak var searchBar: UISearchBar!
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK:- Properties
    weak var delegate: SearchVCDelegate?
    private var source = [SearchItem]()
    
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
        cell.fill(item: source[indexPath.row])
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
        // Dirty.
        let algo = Cryptor.Algorithm.des
        let key = Array(Environment.Ionix.obfuscated.utf8)
        let cryptor = Cryptor.init(operation: .encrypt, algorithm: .des, options: [.ECBMode, .PKCS7Padding], keyBuffer: zeroPad(array: key, blockSize: algo.blockSize()), keyByteCount: 8, ivBuffer: [UInt8](), ivByteCount: [UInt8]().count)
        guard let encrypted = cryptor.update(byteArray: Array(searchText.utf8))?.final() else { return }
        let base64Encrypted = Data(encrypted).base64EncodedString()
        // Dirty.
        
        IonixWSClient.search(rut: base64Encrypted) { [weak self] result in
            self?.hideLoader()
            switch result {
            case .success(let searchResult):
                guard let items = searchResult.result?.items else { return }
                self?.source = items.compactMap { $0 }
                self?.tableView.reloadData()
            case .failure(let error): Toast.init(text: error.localizedDescription).show()
            }
        }
    }
}
