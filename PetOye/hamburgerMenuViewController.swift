//
//  hamburgerMenuViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 14/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class hamburgerMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, backButton {

    @IBOutlet weak var menuTable: UITableView!
    
    @IBOutlet weak var subMenuTable: UITableView!
    
    @IBOutlet weak var subMenuConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    
    var header = ["Home","Pet Care","Pet Leisure","My Adoptions","Online Orders","More"]
    var info = ["","Vets, Groomers, Trainers, etc.", "Cafes, Events, etc.", "", "Order history, payment options, etc.", "About us, Contact us, Add a service, etc."]
    
    var petCare = ["Vets","Groomers","Trainers","Behaviourists","Shops","Walkers","Boarding","Foster Homes"]
    
    var petLeisure = ["Cafes","Events","Stay","Featured Products"]
    
    var orders = ["Order history","Payment options","Address book","Order status"]
    
    var more = ["Add a pet care service","Refer & Earn","About us","Contact us","Log out"]
    
    var tableType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        menuTable.tableFooterView = UIView(frame: CGRect.zero)
        
        subMenuTable.tableFooterView = UIView(frame: CGRect.zero)
        
        subMenuTable.isHidden = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == menuTable {
            
            return header.count + 3
        }
        else {
            
            if tableType == 1 {
                
                return petCare.count + 1
            }
            else if tableType == 2 {
                
                return petLeisure.count + 1
            }
            else if tableType == 3 {
                
                return orders.count + 1
            }
            else {
                
                return more.count + 1
            }
            
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == menuTable {
            
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "hamMenu", for: indexPath)
                
                cell.textLabel?.text = "PetOye"
                cell.textLabel?.textColor = self.HEX37A784()
                cell.textLabel?.font = UIFont(name: "BrandonText-Medium", size: 22)!
                
                cell.selectionStyle = .none
                
                return cell
            }
            else if indexPath.row == 1 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "userInfo", for: indexPath) as! hamUserInfoTableViewCell
                
                cell.name.text = "Ameya Vichare"
                cell.bio.text = "Pet Parent, Beagle"
                cell.profilePic.layer.cornerRadius = 17
                cell.profilePic.clipsToBounds = true
                
                cell.selectionStyle = .none
                
                return cell
                
            }
            else if indexPath.row == 2 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "shortcutMenu", for: indexPath) as! shortcutTableViewCell
                
                cell.myOrders.layer.cornerRadius = 6.5
                cell.myOrders.clipsToBounds = true
                cell.myOrders.layer.borderColor = self.HEXDDBABA().cgColor
                cell.myOrders.layer.borderWidth = 0.5
                
                cell.myCredits.layer.cornerRadius = 6.5
                cell.myCredits.clipsToBounds = true
                cell.myCredits.layer.borderColor = self.HEXDDBABA().cgColor
                cell.myCredits.layer.borderWidth = 0.5
                
                cell.petScan.layer.cornerRadius = 6.5
                cell.petScan.clipsToBounds = true
                cell.petScan.layer.borderColor = self.HEXDDBABA().cgColor
                cell.petScan.layer.borderWidth = 0.5
                
                cell.myQNA.layer.cornerRadius = 6.5
                cell.myQNA.clipsToBounds = true
                cell.myQNA.layer.borderColor = self.HEXDDBABA().cgColor
                cell.myQNA.layer.borderWidth = 0.5
                
                cell.selectionStyle = .none
                
                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "petStuff", for: indexPath) as! petStuffTableViewCell
                
                cell.header.text = header[indexPath.row - 3]
                
                if (indexPath.row == 4 || indexPath.row == 5) || (indexPath.row == 7 || indexPath.row == 8) {
                    
                    cell.accessoryType = .disclosureIndicator
                    
                    cell.info.text = info[indexPath.row - 3]
                }
                else {
                    
                    cell.info.isHidden = true
                    cell.header.frame.origin.y = 9
                    cell.icon.frame.origin.y = 6
                }
                
                cell.icon.layer.cornerRadius = 5
                cell.icon.clipsToBounds = true
                
                cell.selectionStyle = .none
                
                return cell
            }

        }
        else {
            
            if indexPath.row == 0 {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "subMenuTitle", for: indexPath) as! subMenuTitleTableViewCell
                
                cell.delegate = self
                
                if tableType == 1 {
                    
                    cell.menu.text = "Pet Care"
                }
                else if tableType == 2 {
                    
                    cell.menu.text = "Pet Leisure"
                }
                else if tableType == 3 {
                    
                    cell.menu.text = "Online Orders"
                }
                else {
                    
                    cell.menu.text = "More"
                }
                
                cell.selectionStyle = .none

                return cell
            }
            else {
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "subMenu", for: indexPath)
                
                cell.textLabel?.font = UIFont(name: "BrandonText-Medium", size: 12)!
                
                cell.imageView?.image = #imageLiteral(resourceName: "filler")
                
                if tableType == 1 {
                    
                    cell.textLabel?.text = petCare[indexPath.row - 1]
                }
                else if tableType == 2 {
                    
                    cell.textLabel?.text = petLeisure[indexPath.row - 1]
                }
                else if tableType == 3 {
                    
                    cell.textLabel?.text = orders[indexPath.row - 1]
                }
                else {
                    
                    cell.textLabel?.text = more[indexPath.row - 1]
                }
                
                cell.selectionStyle = .none
                
                return cell

            }

        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView == menuTable {
            
            if indexPath.row == 3 {
                
                if let vc = storyboard?.instantiateViewController(withIdentifier: "Home") as? homeViewController {
                    
                    self.revealViewController().pushFrontViewController(vc, animated: true)
                }
            }
            else if indexPath.row == 4 {
                
                tableType = 1
                
                subMenu()
        
            }
            else if indexPath.row == 5 {
                
                tableType = 2
                
                subMenu()
            }
            else if indexPath.row == 6 {
                

//                let vc = storyboard?.instantiateViewController(withIdentifier: "demo") as! demoViewController
//                
//                self.revealViewController().pushFrontViewController(vc, animated: true)
            }
            else if indexPath.row == 7 {
                
                tableType = 3
                
                subMenu()
            }
            else if indexPath.row == 8 {
                
                tableType = 4
                
                subMenu()
            }
            
        }
        
        
    }
    
    func subMenu() {
        
        subMenuTable.isHidden = false
        
        self.subMenuTable.reloadData()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {

            self.subMenuTable.frame.origin.x = 0
            
            UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: { 
                
                self.menuTable.frame.origin.x = -100
                
            }, completion: nil)
            
        }) { (result) in
            
            self.menuTable.isHidden = true
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if tableView == menuTable {
            
            if indexPath.row == 0 {
                
                return 44
            }
            else if indexPath.row == 1 {
                
                return 52
            }
            else if indexPath.row == 2 {
                
                return 152
            }
            else if indexPath.row == 5{
                
                return 38
            }
            else {
                
                return 46
            }

        }
        else {
            
            return 44
        }
    }

    func backPressed() {
        
        menuTable.isHidden = false
        
        self.menuTable.reloadData()
        
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            self.subMenuTable.frame.origin.x = 365
            
            self.menuTable.frame.origin.x = 0
            
        }) { (result) in
            
            self.subMenuTable.isHidden = true
        }

        
    }
    
}
