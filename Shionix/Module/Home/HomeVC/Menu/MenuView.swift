//
//  MenuView.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit
import Reusable

protocol MenuViewDelegate: class {
    func menuDidSelect(at: IndexPath)
}

final class MenuView: UIView, NibOwnerLoadable {
    // IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    
    // MARK:- Properties
    private var source = [MenuItem]()
    weak var delegate: MenuViewDelegate?
    
    // MARK:- Funcs
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.loadNibContent()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: MenuCollectionViewCell.self)
    }
    
    func fill(items: [[MenuItem]]) {
        source = items.flatMap { $0 }
        collectionView.reloadData()
    }
}

extension MenuView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath) as MenuCollectionViewCell
        cell.fill(item: source[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.frame.width / 3.1
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.menuDidSelect(at: indexPath)
    }
}
