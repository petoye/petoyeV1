//
//  reviewInfoTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 26/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class reviewInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var reviews: UILabel!
    
    @IBOutlet weak var reviewsWidth: NSLayoutConstraint!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var expFiller: UIView!

    @IBOutlet weak var expGreen: UIView!
    
    @IBOutlet weak var serviceFiller: UIView!
    
    @IBOutlet weak var serviceGreen: UIView!
    
    @IBOutlet weak var expLabel: UILabel!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var sep: UIView!
}
