//
//  eventsInBookmarksTableViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 15/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class eventsInBookmarksTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 42
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "events", for: indexPath) as! bookmarksTableViewCell
        
        cell.label1.textColor = self.HEX929292()
        cell.label2.textColor = self.HEX929292()
        cell.label2.text = "Mumbai"
        cell.main.text = "Happy Paws, Monsoon pet camp"
        
        return cell
    }
}
