//
//  serviceDetailViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 26/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class serviceDetailViewController: UIViewController {

    @IBOutlet weak var serviceTable: UITableView!
    
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var tagsForService = ["Hip Dislocation","Ticks","Paralysis", "Paralysis"]
    
    var tags = ["3 years exp", "3 kms away", "128 reviews"]
    
    var services = ["General check up", "Consultation", "Vaccination", "Surgery"]
    
    var prices = ["800","500","600","1500"]
    
    var tagImages = [#imageLiteral(resourceName: "exp"),#imageLiteral(resourceName: "distanceAway"),#imageLiteral(resourceName: "reviews")]

    @IBOutlet weak var appointmentView: UIView!
    
    @IBOutlet weak var appButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        serviceTable.tableFooterView = UIView(frame: CGRect.zero)
        
        serviceTable.estimatedRowHeight = 42
        
        serviceTable.rowHeight = UITableViewAutomaticDimension
        
        navBarSetup()
        
        self.view.insertSubview(appointmentView, aboveSubview: serviceTable)
        
        self.appButton.layer.cornerRadius = 3.33
        
        self.appButton.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    func navBarSetup() {
        
        navBar.setBackgroundImage(UIImage(), for: .default)
        navBar.shadowImage = UIImage()
        navBar.isTranslucent = true
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func bookPressed(_ sender: Any) {
        
        
    }
}

extension serviceDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return 2
        }
        else if section == 1{
            
            return services.count + 1
        }
        else {
            
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "serviceHeader", for: indexPath) as! serviceHeaderTableViewCell
                
                cell.rating.layer.cornerRadius = 2.67
                cell.rating.clipsToBounds = true
                
                cell.pic.layer.cornerRadius = 42
                cell.pic.clipsToBounds = true
                
                cell.name.text = "Shailendra Pethe"
                cell.desc.text = "Vet"
                
                cell.name.textColor = self.HEX495767()
                cell.desc.textColor = self.HEX98A5B3()
                
                let nameWidth = self.box(text: "Shailendra Pethe", fontSize: 18, fontName: "BrandonText-Medium").0
                
                let descWidth = self.box(text: "Vet", fontSize: 18, fontName: "BrandonText-Medium").0
                
                cell.nameWidth.constant = nameWidth
                cell.descWidth.constant = descWidth
                
                cell.nameViewWidth.constant = nameWidth + descWidth + 22
                
                cell.sep.frame.origin.x = cell.name.frame.origin.x + nameWidth + 9
                
                cell.layer.contentsScale = UIScreen.main.scale;
                cell.layer.shadowColor = self.HEXC3BDBD().cgColor
                cell.layer.shadowOffset = CGSize.zero
                cell.layer.shadowRadius = 11.0;
                cell.layer.shadowOpacity = 0.7;
                cell.layer.masksToBounds = false;
                
                return cell
                
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "time", for: indexPath) as! serviceAvailableTableViewCell
                
                cell.time.text = "9 am - 7 pm"
                cell.location.text = "Borivali, Mumbai"
                cell.selectionStyle = .none
                return cell
            }

        }
        else if indexPath.section == 1 {
            
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "service", for: indexPath) as! serviceListTableViewCell
                cell.service.text = "Services"
                cell.service?.textColor = self.HEX485764()
                cell.backgroundColor = self.HEXF4F4F4()
                cell.selectionStyle = .none
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "serviceList", for: indexPath) as! serviceListTableViewCell
                cell.service.text = services[indexPath.row-1]
                cell.price.text = prices[indexPath.row-1]
                cell.backgroundColor = self.HEXF4F4F4()
                cell.selectionStyle = .none
                
                if indexPath.row == services.count {
                    
                    cell.separator.isHidden = true
                }
                
                return cell
            }
        }
        else {
            
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "service", for: indexPath) as! serviceListTableViewCell
                cell.service.text = "Reviews"
                cell.service?.textColor = self.HEX485764()
                cell.selectionStyle = .none
                return cell
            }
            else if indexPath.row == 1 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "reviewInfo", for: indexPath) as! reviewInfoTableViewCell
                
                cell.reviews.text = "128 reviews with an average rating of"
                cell.reviewsWidth.constant = self.box(text: "128 reviews with an average rating of", fontSize: 13, fontName: "BrandonText-Medium").0 + 2
                cell.rating.layer.cornerRadius = 2.67
                cell.rating.clipsToBounds = true
                
                cell.expFiller.layer.cornerRadius = 5
                cell.expFiller.clipsToBounds = true
                
                cell.expGreen.layer.cornerRadius = 5
                cell.expLabel.clipsToBounds = true
                
                cell.serviceFiller.layer.cornerRadius = 5
                cell.serviceFiller.clipsToBounds = true
                
                cell.serviceGreen.layer.cornerRadius = 5
                cell.serviceGreen.clipsToBounds = true
                
                cell.expLabel.text = "Vaccinations, checkups, hip dislocation, surgery"
                cell.serviceLabel.text = "Corteous, Humble, Very friendly"
                
                cell.selectionStyle = .none
                return cell

            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "reviewRead", for: indexPath)
                cell.selectionStyle = .none
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            guard let collectionCell = cell as? serviceHeaderTableViewCell else { return }
            collectionCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
            collectionCell.selectionStyle = .none
        }
    }
}

extension serviceDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView.tag == 1 {
            
            return 3
        }
        else if collectionView.tag == 2 {
            
            return tagsForService.count
        }
        else {
            
            return 3
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView.tag == 1 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "headerImage", for: indexPath) as! headerImageCollectionViewCell
            
            cell.pic.image = #imageLiteral(resourceName: "headerFill.png")
            
            cell.overlay.backgroundColor = self.HEX6F6A6A()
            
            return cell
            
        }
        else if collectionView.tag == 2 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tag", for: indexPath) as! tagsCollectionViewCell
            cell.tagLabel.text = tagsForService[indexPath.item]
            cell.layer.cornerRadius = 3.33
            cell.clipsToBounds = true
            return cell
        }
        else {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "footer", for: indexPath) as! tagsCollectionViewCell
            cell.tagLabel.text = tags[indexPath.item]
            cell.tagLabel.textColor = self.HEX667480()
            cell.icon.image = tagImages[indexPath.item]
            
            return cell
            
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView.tag == 1 {
            
            return CGSize(width: 414, height: 160)
        }
        else if collectionView.tag == 2 {
            
            let size = self.box(text: tagsForService[indexPath.item], fontSize: 10, fontName: "BrandonText-Regular").0
            return CGSize(width: size + 10.0, height: 20)
        }
        else {
            
            let size = self.box(text: tags[indexPath.item], fontSize: 13, fontName: "BrandonText-Medium").0
            return CGSize(width: size + 32.0, height: 22)
            
        }
    }
}
