//
//  quickFilterTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 21/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

protocol filterSelect {
    
    func selectFilter(_ row: Int, _ section: Int)
}

class quickFilterTableViewCell: UITableViewCell {
    
    var delegate: filterSelect?

    @IBOutlet weak var filter: UILabel!
    
    @IBOutlet weak var selectButton: UIButton!
    
    
    @IBAction func filterPress(_ sender: UIButton) {
        
        delegate?.selectFilter(sender.row, sender.section)
    }

}
