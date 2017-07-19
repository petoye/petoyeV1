//
//  reminderTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class reminderTableViewCell: UITableViewCell {

    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var type1: UILabel!
    
    @IBOutlet weak var separator: UIImageView!

    @IBOutlet weak var type2: UILabel!
    
    @IBOutlet weak var reminder: UILabel!
    
    @IBOutlet weak var type1Width: NSLayoutConstraint!
    
    @IBOutlet weak var type2Width: NSLayoutConstraint!
    
}
