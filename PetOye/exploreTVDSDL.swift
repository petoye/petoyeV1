//
//  exploreTVDSDL.swift
//  PetOye
//
//  Created by Ameya Vichare on 17/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import Foundation

extension exploreViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return type.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            if type[indexPath.row] == 1 || type[indexPath.row] == 2 {
                
                var identifier = String()
                
                if type[indexPath.row] == 1 {
                    
                    identifier = "questionOnly"
                }
                else {
                    identifier = "questionPlusAnswer"
                }
                
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! questionOnlyTableViewCell
                
                cell.breedType.text = "Saint Bernard"
                cell.question.text = "What is the most effective way to remove ticks for Daschunds?"
                
                cell.tag1.text = "Daschunds"
                cell.tag2.text = "Dogs"
                cell.tag3.text = "Pet Care"
                
                cell.tag1.layer.cornerRadius = 3.33
                cell.tag1.clipsToBounds = true
                
                cell.tag2.layer.cornerRadius = 3.33
                cell.tag2.clipsToBounds = true
                
                cell.tag3.layer.cornerRadius = 3.33
                cell.tag3.clipsToBounds = true
                
                cell.tag1Width.constant = self.box(text: "Daschunds", fontSize: 10, fontName: "BrandonText-Regular").0 + 8
                cell.tag2Width.constant = self.box(text: "Dogs", fontSize: 10, fontName: "BrandonText-Regular").0 + 8
                cell.tag3Width.constant = self.box(text: "Pet Care", fontSize: 10, fontName: "BrandonText-Regular").0 + 8
                
                if type[indexPath.row] == 2 {
                    
                    cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
                    cell.pic.layer.cornerRadius = 10
                    cell.pic.clipsToBounds = true
                    cell.name.text = "Ameya Vichare, Pet Parent - St Bernard "
                    cell.answer.text = "This doggos are very cute like floofballs and get big oh so fucking fast. They are from Switzerland and their natural work is to carry heavy loads so it makes sense Read More his doggos are very cute like floofballs and get big oh so fucking fast. They are from Switzerland and their natural work is to carry heavy loads so it makes sense Read More"
                    
                    cell.answer.numberOfLines = 3
                    
                    cell.answer.isUserInteractionEnabled = false
                    
                    let myMutableString = NSMutableAttributedString(string: "Read More", attributes: [NSFontAttributeName: UIFont(name: "Source Sans Pro", size: 13)])
                    
                    myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.black, range: NSRange(location:0,length:9))
                    
                    cell.answer.collapsedAttributedLink = myMutableString
                    cell.answer.ellipsis = NSAttributedString(string: "...")
                }
                
                cell.selectionStyle = .none
                
                return cell
            }
            else if (type[indexPath.row] == 3 || type[indexPath.row] == 4) || (type[indexPath.row] == 5 || type[indexPath.row] == 6) || (type[indexPath.row] == 7) {
                
                var identifier = String()
                
                if type[indexPath.row] == 3 {
                    
                    identifier = "tookToService"
                }
                else if type[indexPath.row] == 4 {
                    
                    identifier = "ratedService"
                }
                else if type[indexPath.row] == 5 {
                    
                    identifier = "visitedPlace"
                }
                else if type[indexPath.row] == 6 {
                    
                    identifier = "visitedPlaceReview"
                }
                else if type[indexPath.row] == 7 {
                    
                    identifier = "adoptionPost"
                }
                
                let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! tookToServiceTableViewCell
                
                cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
                cell.pic.layer.cornerRadius = 10
                cell.pic.clipsToBounds = true
                
                cell.title.text = "Ameya Vichare took his St Bernard to vet Shailendra Pethe."
                
                if (type[indexPath.row] != 7) {
                    
                    cell.rating.text = "4.5"
                    cell.rating.layer.cornerRadius = 3.33
                    cell.rating.clipsToBounds = true
                    cell.ratedTimes.text = "average rated for 125 times"
                    cell.expertiseBar.layer.cornerRadius = 4
                    cell.expertiseFiller.layer.cornerRadius = 4
                    cell.serviceBar.layer.cornerRadius = 4
                    cell.serviceFiller.layer.cornerRadius = 4
                    cell.expertiseBar.clipsToBounds = true
                    cell.expertiseFiller.clipsToBounds = true
                    cell.serviceBar.clipsToBounds = true
                    cell.serviceFiller.clipsToBounds = true
                    
                    cell.location.text = "3kms away from you"
                }
                
                
                cell.expertiseDesc.text = "Vaccinations, checkups, hipdislocation, surgery"
                cell.serviceDesc.text = "Corteous, Humble, Very friendly"
                
                
                if type[indexPath.row] == 4 || type[indexPath.row] == 6 {
                    
                    if type[indexPath.row] == 4 {
                        
                        cell.title.text = "Ameya Vichare gave vet Shailendra Pethe a 4 star review"
                    }
                    else {
                        
                        cell.title.text = "Ameya Vichare gave Pawfect Life a 4 star review"
                    }
                    
                    
                    cell.review.text = "Best vet ever. If you’re in Borivali you should definitely go to him. He will take care of your pet as if he’s his own pet blah blah blah Best vet ever. If you’re in Borivali you should definitely go to him. He will take care of your pet as if he’s his own pet blah blah blah"
                    cell.review.numberOfLines = 2
                    cell.review.isUserInteractionEnabled = false
                    cell.review.collapsedAttributedLink = NSAttributedString(string: "Read more")
                    cell.review.ellipsis = NSAttributedString(string: "...")
                }
                else if type[indexPath.row] == 5 {
                    
                    cell.title.text = "Ameya Vichare visited Pawfect Life with his St Bernard."
                }
                else if type[indexPath.row] == 7 {
                    
                    
                    cell.pic.layer.cornerRadius = 15
                    
                    cell.title.text = "Ameya Vichare posted a new adoption for Jimmy"
                    
                    let adoptionAge = "5 years old"
                    let adoptionBreed = "Daschund"
                    let adoptionLocation = "5 kms away"
                    cell.adoptionAge.text = adoptionAge
                    cell.adoptionBreed.text = adoptionBreed
                    cell.adoptionLocation.text = adoptionLocation
                    
                    cell.adoptionAge.textColor = self.HEX929292()
                    cell.adoptionBreed.textColor = self.HEX929292()
                    cell.adoptionLocation.textColor = self.HEX929292()
                    
                    cell.width1.constant = self.box(text: adoptionAge, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                    cell.width2.constant = self.box(text: adoptionBreed, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                    cell.width3.constant = self.box(text: adoptionLocation, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                    
                    cell.separator1.frame.origin.x = cell.adoptionAge.frame.origin.x + 3 + cell.width1.constant
                    cell.separator2.frame.origin.x = cell.separator1.frame.origin.x + 3 + cell.width2.constant + 6
                    
                    if type[indexPath.row] == 7 {
                        
                        cell.adoptionDesc.text = "Jimmy is a very cute St Bernard This doggos are very cute like floofballs and get big oh so fucking fast. They are from Switzerland and their Jimmy is a very cute St Bernard This doggos are very cute like floofballs and get big oh so fucking fast. They are from Switzerland and their"
                        cell.adoptionDesc.numberOfLines = 2
                        cell.adoptionDesc.isUserInteractionEnabled = false
                        cell.adoptionDesc.collapsedAttributedLink = NSAttributedString(string: "Read more")
                        cell.adoptionDesc.ellipsis = NSAttributedString(string: "...")
                    }
                    
                }
                cell.selectionStyle = .none
                
                return cell
                
            }
            else if type[indexPath.row] == 8 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "adoptedPost", for: indexPath) as! tookToServiceTableViewCell
                
                cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
                cell.pic.layer.cornerRadius = 15
                cell.pic.clipsToBounds = true
                
                cell.title.text = "Ameya Vichare adopted Jimmy"
                
                let adoptionAge = "5 years old"
                let adoptionBreed = "Daschund"
                let adoptionLocation = ""
                cell.adoptionAge.text = adoptionAge
                cell.adoptionBreed.text = adoptionBreed
                cell.adoptionLocation.text = adoptionLocation
                
                cell.adoptionAge.textColor = self.HEX929292()
                cell.adoptionBreed.textColor = self.HEX929292()
                cell.adoptionLocation.textColor = self.HEX929292()
                
                cell.width1.constant = self.box(text: adoptionAge, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                cell.width2.constant = self.box(text: adoptionBreed, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                cell.width3.constant = self.box(text: adoptionLocation, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                
                cell.separator1.frame.origin.x = cell.adoptionAge.frame.origin.x + 3 + cell.width1.constant
                cell.separator2.isHidden = true
                
                cell.kudosButton.setTitle("Give Kudos", for: .normal)
                cell.kudosButton.titleLabel?.font = UIFont(name: "BrandonText-Light", size: 12)
                cell.kudosButton.setImage(#imageLiteral(resourceName: "heart"), for: .normal)
                cell.kudosButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
                
                return cell
            }
            else if type[indexPath.row] == 9 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "event", for: indexPath) as! tookToServiceTableViewCell
                
                cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
                cell.pic.layer.cornerRadius = 15
                cell.pic.clipsToBounds = true
                
                let adoptionAge = "Event"
                let adoptionBreed = "3 kms away"
                cell.adoptionAge.text = adoptionAge
                cell.adoptionBreed.text = adoptionBreed
                
                cell.adoptionAge.textColor = self.HEX929292()
                cell.adoptionBreed.textColor = self.HEX929292()
                
                cell.date.text = "23/07/2017"
                cell.venue.text = "Karjat Heritage Resort, Karjat"
                cell.charges.text = "Rs.500"
                
                cell.date.textColor = self.HEX667480()
                cell.venue.textColor = self.HEX667480()
                cell.charges.textColor = self.HEX667480()
                
                cell.width1.constant = self.box(text: adoptionAge, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                cell.width2.constant = self.box(text: adoptionBreed, fontSize: 12, fontName: "BrandonText-Regular").0 + 4
                
                cell.separator1.frame.origin.x = cell.adoptionAge.frame.origin.x + 3 + cell.width1.constant
                
                cell.title.text = "Ameya Vichare is going to the Happy Paws event"
                
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "questionOnly", for: indexPath)
                
                return cell
            }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
        if (type[indexPath.row] == 5 || type[indexPath.row] == 6) || (type[indexPath.row] == 7 || type[indexPath.row] == 8) || type[indexPath.row] == 9 {

                guard let collectionCell = cell as? tookToServiceTableViewCell else { return }
                collectionCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
                collectionCell.selectionStyle = .none
            }
    }
    
}

extension exploreViewController: UITableViewDelegate {
    
}

extension exploreViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.storiesCollection {
            
            return photos.count
        }
        else {
            
            return 4
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.storiesCollection {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "story", for: indexPath) as! storyCollectionViewCell
            
            cell.layer.cornerRadius = 3.33
            cell.clipsToBounds = true
            
            cell.marker.text = "STORY"
            cell.marker.textColor = UIColor.white
            cell.marker.backgroundColor = self.HEX37A784()
            
            cell.header.text = "What's all that noise?"
            
            cell.layer.contentsScale = UIScreen.main.scale;
            cell.layer.shadowColor = self.HEX7C7575().cgColor;
            cell.layer.shadowOffset = CGSize.zero//CGSize(width: 3.0, height: 3.0);
            cell.layer.shadowRadius = 4.0;
            cell.layer.shadowOpacity = 0.3;
            cell.layer.masksToBounds = false;
            
            cell.image.image = photos[indexPath.item]
//            cell.image.layer.cornerRadius = 3.33
//            cell.image.clipsToBounds = true
            
            return cell
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "image", for: indexPath) as! imagesInExploreCollectionViewCell
            
            cell.image.layer.cornerRadius = 5
            cell.image.clipsToBounds = true
            
            return cell
        }
        
        
    }
}

extension exploreViewController: UICollectionViewDelegate {
    
}
