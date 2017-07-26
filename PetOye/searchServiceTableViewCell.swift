//
//  searchServiceTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 25/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class searchServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var type1: UILabel!

    @IBOutlet weak var type2: UILabel!
    
    @IBOutlet weak var type3: UILabel!
    
    @IBOutlet weak var timeIcon: UIImageView!
    
    @IBOutlet weak var timeAvailable: UILabel!
    
    @IBOutlet weak var expFillerGrey: UIView!
    
    @IBOutlet weak var expGreen: UIView!
    
    @IBOutlet weak var serviceFillerGrey: UIView!
    
    @IBOutlet weak var serviceGreen: UIView!
    
    @IBOutlet weak var expLabel: UILabel!
    
    @IBOutlet weak var serviceLabel: UILabel!
    
    @IBOutlet weak var type1Width: NSLayoutConstraint!
    
    @IBOutlet weak var type2Width: NSLayoutConstraint!
    
    @IBOutlet weak var type3Width: NSLayoutConstraint!
    
    @IBOutlet weak var sep1: UIImageView!
    
    @IBOutlet weak var sep2: UIImageView!
    
    @IBOutlet weak var detail1: UILabel!
    
    @IBOutlet weak var detail2: UILabel!
    
    @IBOutlet fileprivate weak var tagsCollectionView: UICollectionView!
    
    @IBOutlet fileprivate weak var photoCollectionView: UICollectionView!
    
}

extension searchServiceTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        if row == 100 {
            
            tagsCollectionView.delegate = dataSourceDelegate
            tagsCollectionView.dataSource = dataSourceDelegate
            tagsCollectionView.tag = 100
            
            DispatchQueue.main.async {
                self.tagsCollectionView.reloadData()
            }
        }
        else {
            
            photoCollectionView.delegate = dataSourceDelegate
            photoCollectionView.dataSource = dataSourceDelegate
            photoCollectionView.tag = 101
            
            DispatchQueue.main.async {
                self.photoCollectionView.reloadData()
            }
        }
        
        //        if let flowLayout = imageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        //            flowLayout.minimumInteritemSpacing = 25
        //        }
        
        
        
    }
}
