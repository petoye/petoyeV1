//
//  homeRecentSearchTVDSDL.swift
//  PetOye
//
//  Created by Ameya Vichare on 20/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import Foundation

extension homeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            
            return nearbyContent.count
        }
        else {
            
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "recentSearch", for: indexPath) as! searchTableViewCell
        
        cell.searchTag.text = ""
        cell.searchTag.textColor = self.HEX929292()
        cell.selectionStyle = .none
        
        if indexPath.section == 0 {
            
            cell.icon.image = #imageLiteral(resourceName: "nearby")
            cell.title.text = nearbyContent[indexPath.row]
        }
        else {
            
            cell.icon.image = #imageLiteral(resourceName: "Search")
            cell.title.text = "test"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 40))
        view.backgroundColor = self.HEXF8F8F8()
        
        let header = UILabel(frame: CGRect(x: 15, y: 10, width: 150, height: 20))
        header.textColor = self.HEX929292()
        header.font = UIFont(name: "BrandonText-Medium", size: 14.0)
        
        if section == 0 {
            
            header.text = "NEARBY YOU"
        }
        else {
            
            header.text = "RECENT SEARCHES"
        }

        view.addSubview(header)
        
        return view

    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40.0
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        searchBar.text = ""
//        
//        closeButton.isHidden = true
//        bookmarkButton.isHidden = false
//        
//        recentSearchtTable.isHidden = true
        
        self.performSegue(withIdentifier: "searchResult", sender: self)
    }
}
