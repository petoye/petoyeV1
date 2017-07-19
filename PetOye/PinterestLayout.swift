//
//  PinterestLayout.swift
//  PetOye
//
//  Created by Ameya Vichare on 18/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

protocol PinterestLayoutDelegate {
    // 1
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath,
                        withWidth:CGFloat) -> CGFloat
    // 2
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

class PinterestLayoutAttributes: UICollectionViewLayoutAttributes {

    var photoHeight: CGFloat = 0.0
    
    override func copy(with zone: NSZone? = nil) -> Any {
        
        let copy = super.copy(with: zone) as! PinterestLayoutAttributes
        copy.photoHeight = photoHeight
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        
        if let attributes = object as? PinterestLayoutAttributes {
            
            if attributes.photoHeight == photoHeight {
                
                return super.isEqual(object)
            }
        }
        return false
    }
}

class PinterestLayout: UICollectionViewFlowLayout {
    
    // 1
    var delegate: PinterestLayoutDelegate!
    
    // 2
    var numberOfColumns = 2
    var cellPadding: CGFloat = 6.0
    
    // 3
    private var cache = [PinterestLayoutAttributes]()
    
    // 4
    private var contentHeight: CGFloat  = 0.0
    private var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        // 1
        if cache.isEmpty {
            // 2
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset = [CGFloat]()
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            // 3
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                
                // 4
                let width = columnWidth - cellPadding * 2
                let photoHeight = delegate.collectionView(collectionView: collectionView!, heightForPhotoAtIndexPath: indexPath, withWidth: width)
                let annotationHeight = delegate.collectionView(collectionView: collectionView!, heightForAnnotationAtIndexPath: indexPath, withWidth: width)
                let height = cellPadding +  photoHeight + annotationHeight + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                // 5
                let attributes = PinterestLayoutAttributes(forCellWith: indexPath)
                attributes.photoHeight = photoHeight
                attributes.frame = insetFrame
                cache.append(attributes)
                
                // 6
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                let othercolumn = column + 1
                
                column = column >= (numberOfColumns - 1) ? 0 : othercolumn
            }
        }
    }
    
    override var collectionViewContentSize : CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes = [UICollectionViewLayoutAttributes]()
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override class var layoutAttributesClass : AnyClass {
        return PinterestLayoutAttributes.self
    }

}
