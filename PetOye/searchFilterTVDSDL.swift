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
        else if tableView == self.breedTable {
            
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
        else if tableView == self.breedTable {
            
            if shouldShowSearchResults2 {
                
                return filteredBreeds.count
            }
            else {
                
                return breeds.count
            }
        }
        else {
            
            return type.count
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
        else if tableView == self.breedTable {
            
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
        else {
            
            var identifier = String()
            
            if type[indexPath.row] == 1 {
                
                identifier = "serviceResult"
            }
            else if type[indexPath.row] == 2 {
                
                identifier = "leisureResult"
            }
            else {
                
                identifier = "eventResult"
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! searchServiceTableViewCell
            
            
            
            if type[indexPath.row] == 1 {
                
                cell.rating.layer.cornerRadius = 2.67
                cell.rating.clipsToBounds = true
                
                cell.timeAvailable.text = "Available from 9 am - 7 pm today"
                cell.timeAvailable.textColor = self.HEX37A784()
                
                cell.pic.layer.cornerRadius = 17
                cell.pic.clipsToBounds = true
                cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
                
                cell.name.text = "Dr. Shailendra Pethe"
                
                cell.type1.text = "Vet"
                cell.type2.text = "3 years exp"
                cell.type3.text = "3 kms away"
                
                cell.type1Width.constant = self.box(text: "Vet", fontSize: 13, fontName: "BrandonText-Regular").0 + 2
                cell.type2Width.constant = self.box(text: "3 years exp", fontSize: 13, fontName: "BrandonText-Regular").0
                cell.type3Width.constant = self.box(text: "3 kms away", fontSize: 13, fontName: "BrandonText-Regular").0
                
                cell.sep1.frame.origin.x = cell.type1.frame.origin.x + cell.type1Width.constant + 3.5
                cell.sep2.frame.origin.x = cell.sep1.frame.origin.x + cell.type2Width.constant + 7
                
                cell.expFillerGrey.layer.cornerRadius = 5
                cell.expFillerGrey.clipsToBounds = true
                
                cell.expGreen.layer.cornerRadius = 5
                cell.expGreen.clipsToBounds = true
                
                cell.serviceFillerGrey.layer.cornerRadius = 5
                cell.serviceFillerGrey.clipsToBounds = true
                
                cell.serviceGreen.layer.cornerRadius = 5
                cell.serviceGreen.clipsToBounds = true
                
                cell.expLabel.text = "Vaccinations, checkups, hip dislocation, surgery"
                cell.serviceLabel.text = "Corteous, Humble, Very friendly"

            }
            else if type[indexPath.row] == 2 {
                
                cell.rating.layer.cornerRadius = 2.67
                cell.rating.clipsToBounds = true
                
                cell.timeAvailable.text = "Available from 9 am - 7 pm today"
                cell.timeAvailable.textColor = self.HEX37A784()
                
                cell.name.text = "Pawfect Life"
                cell.type1.text = "Pet Boarding"
                cell.type2.text = "3 kms away"
                
                cell.type1Width.constant = self.box(text: "Pet Boarding", fontSize: 13, fontName: "BrandonText-Regular").0 + 2
                cell.type2Width.constant = self.box(text: "3 kms away", fontSize: 13, fontName: "BrandonText-Regular").0 + 2
                
                cell.sep1.frame.origin.x = cell.type1.frame.origin.x + cell.type1Width.constant + 3.5
                
                cell.detail1.text = "Cats, Dogs, Rabbits"
                cell.detail2.text = "Rs.500 for a day"
            }
            else {
                
                cell.name.text = "Happy Paws"
                cell.type1.text = "Event"
                cell.type2.text = "3 kms away"
                cell.timeAvailable.text = "27/07/2017"
                
                cell.type1Width.constant = self.box(text: "Event", fontSize: 13, fontName: "BrandonText-Regular").0 + 2
                cell.type2Width.constant = self.box(text: "3 kms away", fontSize: 13, fontName: "BrandonText-Regular").0 + 2
                
                cell.sep1.frame.origin.x = cell.type1.frame.origin.x + cell.type1Width.constant + 3.5
                
                cell.detail1.text = "Karjat Heritage Resort, Karjat"
                cell.detail2.text = "Rs.500 for a day"
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
        else {
            
            guard let collectionCell = cell as? searchServiceTableViewCell else { return }
            
            if type[indexPath.row] == 1 {
                
                collectionCell.setCollectionViewDataSourceDelegate(self, forRow: 100)
            }
            else {
                
                collectionCell.setCollectionViewDataSourceDelegate(self, forRow: 101)
            }

            collectionCell.selectionStyle = .none
        }
    }
}

extension searchViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            
            return sortByForService.count
        }
        else if collectionView.tag == 2 {
            
            return 3
        }
        else {
            
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 || collectionView.tag == 2 {
            
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
        else {
            
            if collectionView.tag == 100 {
                
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath) as! tagsCollectionViewCell
                
                cell.tagLabel.text = tagsForService[indexPath.row]
                
                cell.layer.cornerRadius = 3.33
                cell.clipsToBounds = true
                cell.layer.borderColor = self.HEX37A784().cgColor
                cell.layer.borderWidth = 0.5
                
                return cell
            }
            else {
                
                let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "photo", for: indexPath) as! imagesInExploreCollectionViewCell

                cell.image.image = #imageLiteral(resourceName: "doggo.jpg")
                cell.image.layer.cornerRadius = 3.33
                cell.image.clipsToBounds = true
                
                return cell
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView.tag == 1 || collectionView.tag == 2) {
            
            return CGSize(width: 91, height: 65)
        }
        else if collectionView.tag == 101 {
            
            return CGSize(width: 90, height: 90)
        }
        else {
            
            let size = self.box(text: tagsForService[indexPath.item], fontSize: 10, fontName: "BrandonText-Regular").0
            return CGSize(width: size + 10.0, height: 20)
        }
    }
    
}
