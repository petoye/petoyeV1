//
//  storyHeaderTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

protocol backButtonInStory {
    
    func backButtonPressed()
}

class storyHeaderTableViewCell: UITableViewCell {
    
    var delegate : backButtonInStory?
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var time: UILabel!

    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var author: UILabel!
    
    @IBAction func backPressed(_ sender: Any) {
        
        print("press")
        
        delegate?.backButtonPressed()
    }
    
}
