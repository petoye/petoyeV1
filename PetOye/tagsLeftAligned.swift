//
//  tagsLeftAligned.swift
//  PetOye
//
//  Created by Ameya Vichare on 25/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class tagsLeftAligned: UICollectionViewFlowLayout {

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let oldAttributes = super.layoutAttributesForElements(in: rect) else {
            return super.layoutAttributesForElements(in: rect)
        }
        let spacing = CGFloat(10) // REPLACE WITH WHAT SPACING YOU NEED
        var newAttributes = [UICollectionViewLayoutAttributes]()
        var leftMargin = self.sectionInset.left
        for attributes in oldAttributes {
            if (attributes.frame.origin.x == self.sectionInset.left) {
                leftMargin = self.sectionInset.left
            } else {
                var newLeftAlignedFrame = attributes.frame
                newLeftAlignedFrame.origin.x = leftMargin
                attributes.frame = newLeftAlignedFrame
            }
            
            leftMargin += attributes.frame.width + spacing
            newAttributes.append(attributes)
        }
        return newAttributes
    }

}
