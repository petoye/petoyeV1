//
//  questionOnlyTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 17/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import ExpandableLabel

class questionOnlyTableViewCell: UITableViewCell {

    @IBOutlet weak var breedType: UILabel!
    
    @IBOutlet weak var question: UILabel!

    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var tag1: UILabel!
    
    @IBOutlet weak var tag2: UILabel!
    
    @IBOutlet weak var tag3: UILabel!
    
    @IBOutlet weak var tag1Width: NSLayoutConstraint!
    
    @IBOutlet weak var tag2Width: NSLayoutConstraint!
    
    @IBOutlet weak var tag3Width: NSLayoutConstraint!
    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var answer: ExpandableLabel!
    
}
