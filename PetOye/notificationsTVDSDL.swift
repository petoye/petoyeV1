//
//  notificationsTVDSDL.swift
//  PetOye
//
//  Created by Ameya Vichare on 18/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

extension notificationsViewController: UITableViewDataSource, followButton {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == self.reminderTable {
            
            return 10
        }
        else {
            
            return notifType.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.reminderTable {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "reminder", for: indexPath) as! reminderTableViewCell
            
            cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
            cell.pic.layer.cornerRadius = 21
            cell.pic.clipsToBounds = true
            
            let type1 = "Service"
            let type2 = "Grooming"
            
            cell.type1.text = type1
            cell.type2.text = type2
            
            cell.type1.textColor = self.HEX929292()
            cell.type2.textColor = self.HEX929292()
            
            cell.time.textColor = self.HEXC6C6C6()
            
            cell.type1Width.constant = self.box(text: type1, fontSize: 12.0, fontName: "BrandonText-Regular").0 + 1
            
            cell.type2Width.constant = self.box(text: type2, fontSize: 12.0, fontName: "BrandonText-Regular").0
            
            cell.separator.frame.origin.x = cell.type1.frame.origin.x + cell.type1Width.constant + 3
            
            cell.reminder.text = "You have an vet appointment with Shailendra Pethe today at 10:00 pm."
            
            cell.selectionStyle = .none
            
            return cell
        }
        else {
            
            var identifier = String()
            
            if notifType[indexPath.row] == 1 || notifType[indexPath.row] == 2{
                
                identifier = "notif"
            }
            else {
                
                identifier = "notif2"
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! notifTableViewCell
            
            cell.time.textColor = self.HEXC6C6C6()
            cell.pic.image = #imageLiteral(resourceName: "demo.jpg")
            cell.pic.layer.cornerRadius = 21
            cell.pic.clipsToBounds = true

            if notifType[indexPath.row] == 1 {
                
                cell.delegate = self
                cell.follow.tag = indexPath.row
                cell.header.text = "Ameya Vichare"
                cell.notification.text = "started following you."
                cell.notification.textColor = self.HEXAAAAAA()
                cell.postPic.isHidden = true
            }
            else if notifType[indexPath.row] == 2 {
                cell.header.text = "Adoption"
                cell.notification.text = "You have been accepted for Jimmy’s adoption."
                cell.header.textColor = self.HEX929292()
                cell.header.font = UIFont(name: "BrandonText-Regular", size: 12)
                cell.postPic.image = #imageLiteral(resourceName: "doggo.jpg")
                cell.follow.isHidden = true
            }
            else {
                cell.header.text = "Question"
                cell.type2.text = "New Answer"
                cell.notification.text = "You have been accepted for Jimmy’s adoption."
                
                cell.header.textColor = self.HEX929292()
                cell.type2.textColor = self.HEX929292()
                
                cell.type1Width.constant = self.box(text: "Question", fontSize: 12.0, fontName: "BrandonText-Regular").0 + 1
                cell.type2Width.constant = self.box(text: "New Answer", fontSize: 12.0, fontName: "BrandonText-Regular").0 + 1
                cell.separator.frame.origin.x = cell.header.frame.origin.x + cell.type1Width.constant + 3
            }
            
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func followPressed(_ row: Int) {
        
        let indexPath = IndexPath(row: row, section: 0)
        
        let cell = notifTable.cellForRow(at: indexPath) as! notifTableViewCell
        
        cell.follow.setImage(#imageLiteral(resourceName: "Followed"), for: .normal)
        
        self.notifTable.reloadData()
    }
}

extension notificationsViewController: UITableViewDelegate {
    
    
}
