//
//  MenuView.swift
//  Shionix
//
//  Created by azerty on 18/03/2020.
//  Copyright © 2020 azerty. All rights reserved.
//

import UIKit
import Reusable

final class MenuView: UIView, NibOwnerLoadable {
    // IBOutlets
    
    
    // MARK:- Funcs
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      self.loadNibContent()
    }
    
    func fill(items: [[MenuItem]]) {
        
    }
}
