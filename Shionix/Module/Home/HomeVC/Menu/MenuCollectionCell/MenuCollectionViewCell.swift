//
//  MenuCollectionViewCell.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit
import Reusable

final class MenuCollectionViewCell: UICollectionViewCell, NibReusable {
    // MARK:- IBOutlets
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuTitle: UILabel!
    
    // MARK:- funcs
    func fill(item: MenuItem) {
        menuTitle.text = item.title
        guard let imageName = item.icon else { return }
        menuImage.image = UIImage.init(named: imageName)
    }
}
