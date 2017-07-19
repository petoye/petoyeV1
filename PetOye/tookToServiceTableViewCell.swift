//
//  tookToServiceTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 17/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import ExpandableLabel

class tookToServiceTableViewCell: UITableViewCell {

    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var ratedTimes: UILabel!

    @IBOutlet weak var expertiseBar: UIView!
    
    @IBOutlet weak var serviceBar: UIView!
    
    @IBOutlet weak var expertiseDesc: UILabel!
    
    @IBOutlet weak var serviceDesc: UILabel!
    
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var expertiseFiller: UIView!
    
    @IBOutlet weak var serviceFiller: UIView!
    
    @IBOutlet weak var review: ExpandableLabel!
    
    @IBOutlet weak var footer: UIView!
    
    @IBOutlet weak var adoptionAge: UILabel!
    
    @IBOutlet weak var adoptionBreed: UILabel!
    
    @IBOutlet weak var adoptionLocation: UILabel!
    
    @IBOutlet weak var adoptionDesc: ExpandableLabel!
    
    @IBOutlet weak var separator1: UIImageView!
    
    @IBOutlet weak var separator2: UIImageView!
    
    @IBOutlet weak var width1: NSLayoutConstraint!
    
    @IBOutlet weak var width2: NSLayoutConstraint!
    
    @IBOutlet weak var width3: NSLayoutConstraint!
    
    @IBOutlet weak var kudosButton: UIButton!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var venue: UILabel!
    
    @IBOutlet weak var charges: UILabel!
    
    @IBOutlet fileprivate weak var imageCollectionView: UICollectionView!
    
    
}

extension tookToServiceTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        imageCollectionView.delegate = dataSourceDelegate
        imageCollectionView.dataSource = dataSourceDelegate
        imageCollectionView.tag = row

//        if let flowLayout = imageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.minimumInteritemSpacing = 25
//        }

        DispatchQueue.main.async {
            self.imageCollectionView.reloadData()
        }
        
    }
}
