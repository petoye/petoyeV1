//
//  searchFilterTVDSDL.swift
//  PetOye
//
//  Created by Ameya Vichare on 21/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import Foundation

extension searchViewController : UITableViewDataSource, UITableViewDelegate, filterSelect {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if tableView == self.filterTable {
            
            return 5
        }
        else if tableView == self.tagsTable {
            
            return 1
        }
        else {
            
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.filterTable {
            
            if section == 0 {
                
                return quickFilterForVets.count
            }
            else {
                
                return 1
            }
        }
        else if tableView == self.tagsTable {
            
            if shouldShowSearchResults {
                
                return filteredTags.count
            }
            else {
                
                return tags.count
            }
        }
        else {
            
            if shouldShowSearchResults2 {
                
                return filteredBreeds.count
            }
            else {
                
                return breeds.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.filterTable {
            
            if indexPath.section == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "quickFilters", for: indexPath) as! quickFilterTableViewCell
                
                cell.filter.text = quickFilterForVets[indexPath.row]
                
                cell.delegate = self
                cell.selectButton.row = indexPath.row
                cell.selectButton.section = indexPath.section
                
                cell.selectionStyle = .none
                return cell
            }
            else if indexPath.section == 1 || indexPath.section == 2 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "sortBy", for: indexPath) as! sortByTableViewCell
                
                cell.selectionStyle = .none
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "tag", for: indexPath) as! tagsTableViewCell
                
                cell.title.textColor = self.HEX929292()
                
                if indexPath.section == 3 {
                    
                    cell.title.text = "TAGS"
                }
                else {
                    
                    cell.title.text = "BREED TYPE"
                }
                
                cell.selectionStyle = .none
                return cell
                
                
            }

        }
        else if tableView == self.tagsTable {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quickFilters", for: indexPath) as! quickFilterTableViewCell
            
            if !shouldShowSearchResults {
                
                let tag = tags[indexPath.row]
                cell.filter.text = tag.name
            }
            else {
                
                let tag = filteredTags[indexPath.row]
                cell.filter.text = tag.name
            }
            
            cell.selectionStyle = .none
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "quickFilters", for: indexPath) as! quickFilterTableViewCell
            
            if !shouldShowSearchResults2 {
                
                let breed = breeds[indexPath.row]
                cell.filter.text = breed.name
            }
            else {
                
                let breed = filteredBreeds[indexPath.row]
                cell.filter.text = breed.name
            }
            cell.selectionStyle = .none
            return cell
        }
    }
    
    func selectFilter(_ row: Int, _ section: Int) {
        
        let indexPath = IndexPath(row: row, section: section)
        
        let cell = filterTable.cellForRow(at: indexPath) as! quickFilterTableViewCell
        
        cell.selectButton.setImage(#imageLiteral(resourceName: "boxTick"), for: .normal)
 
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == self.filterTable {
            
            if indexPath.section == 0 {
                
                selectFilter(indexPath.row, indexPath.section)
            }
            else if indexPath.section == 3 {
                
                tagViewShow(token: 1)
            }
            else if indexPath.section == 4 {
                
                tagViewShow(token: 2)
            }
        }

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if tableView == self.filterTable {
            
            if section == 3 || section == 4 {
                
                return 10
            }
            else {
                
                return 33.3
            }
        }
        else {
            
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == self.filterTable {
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
            view.backgroundColor = self.HEXF8F8F8()
            
            let header = UILabel(frame: CGRect(x: 15, y: 10, width: 150, height: 20))
            header.textColor = self.HEX929292()
            header.font = UIFont(name: "BrandonText-Medium", size: 14.0)
            
            if section == 0 {
                
                header.text = "QUICK FILTERS"
            }
            else if section == 1 {
                
                header.text = "SORT BY"
            }
            else if section == 2 {
                
                header.text = "COST"
            }
            else {
                
                header.text = ""
            }
            
            view.addSubview(header)
            
            return view
        }
        else {
            
            return nil
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if tableView == self.filterTable {
            
            if indexPath.section == 1 || indexPath.section == 2 {
                
                guard let collectionCell = cell as? sortByTableViewCell else { return }
                collectionCell.setCollectionViewDataSourceDelegate(self, forSection: indexPath.section)
                collectionCell.selectionStyle = .none
            }
        }
    }
}

extension searchViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            
            return sortByForService.count
        }
        else {
            
            return 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "sortByCell", for: indexPath) as! sortByCollectionViewCell
        
        if collectionView.tag == 1 {
            
            cell.icon.image = sortByForService[indexPath.item]
            cell.title.text = sortByTitleForService[indexPath.item]
        }
        else {
            
            cell.icon.image = #imageLiteral(resourceName: "indian-rupee")
            cell.title.text = costForService[indexPath.row]
        }
        cell.title.textColor = self.HEX929292()
        return cell
    }
}
