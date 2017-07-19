//
//  notifTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

protocol followButton {
    
    func followPressed(_ row: Int)
}

class notifTableViewCell: UITableViewCell {
    
    var delegate: followButton?

    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var notification: UILabel!

    @IBOutlet weak var follow: UIButton!
    
    @IBOutlet weak var postPic: UIImageView!
    
    @IBOutlet weak var separator: UIImageView!
    
    @IBOutlet weak var type2: UILabel!
    
    @IBOutlet weak var type1Width: NSLayoutConstraint!
    
    @IBOutlet weak var type2Width: NSLayoutConstraint!
    
    @IBAction func followButton(_ sender: UIButton) {
        
        delegate?.followPressed(sender.tag)
    }
}
