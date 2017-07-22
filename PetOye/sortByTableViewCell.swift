//
//  sortByTableViewCell.swift
//  PetOye
//
//  Created by Ameya Vichare on 21/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class sortByTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var sortByCollection: UICollectionView!
    
}

extension sortByTableViewCell {
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forSection section: Int) {
        
        sortByCollection.delegate = dataSourceDelegate
        sortByCollection.dataSource = dataSourceDelegate
        sortByCollection.tag = section
        
        //        if let flowLayout = imageCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
        //            flowLayout.minimumInteritemSpacing = 25
        //        }
        
        DispatchQueue.main.async {
            self.sortByCollection.reloadData()
        }
        
    }
}
