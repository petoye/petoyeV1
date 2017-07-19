//
//  storyCollectionViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 18/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class storyCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var marker: UILabel!
    
    @IBOutlet weak var header: UILabel!
    
    @IBOutlet weak var imageViewHeightLayoutConstraint: NSLayoutConstraint!
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterestLayoutAttributes {
            imageViewHeightLayoutConstraint.constant = attributes.photoHeight
        }
    }
}
