//
//  subMenuTitleTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 14/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

protocol backButton {
    
    func backPressed()
}

class subMenuTitleTableViewCell: UITableViewCell {
    
    var delegate: backButton?
    
    @IBOutlet weak var menu: UILabel!
    
    
    @IBAction func backPressed(_ sender: Any) {
        
        delegate?.backPressed()
    }


}
