//
//  serviceHeaderTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 26/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class serviceHeaderTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var headerCollection: UICollectionView!
    
    @IBOutlet fileprivate weak var tagsCollectionView: UICollectionView!
    
    @IBOutlet weak var footerCollection: UICollectionView!
    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var nameViewWidth: NSLayoutConstraint!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var desc: UILabel!

    @IBOutlet weak var nameWidth: NSLayoutConstraint!
    
    @IBOutlet weak var descWidth: NSLayoutConstraint!
    
    @IBOutlet weak var sep: UIImageView!
}

extension serviceHeaderTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {

            headerCollection.delegate = dataSourceDelegate
            headerCollection.dataSource = dataSourceDelegate
            headerCollection.tag = 1
        
            tagsCollectionView.delegate = dataSourceDelegate
            tagsCollectionView.dataSource = dataSourceDelegate
            tagsCollectionView.tag = 2
        
            footerCollection.delegate = dataSourceDelegate
            footerCollection.dataSource = dataSourceDelegate
            footerCollection.tag = 3
        
            DispatchQueue.main.async {
                self.headerCollection.reloadData()
                self.tagsCollectionView.reloadData()
                self.footerCollection.reloadData()
            }
        
        
        
        //        if let flowLayout = imageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        //            flowLayout.minimumInteritemSpacing = 25
        //        }

    }
}
