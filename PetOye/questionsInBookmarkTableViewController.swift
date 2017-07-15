//
//  questionsInBookmarkTableViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 15/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class questionsInBookmarkTableViewController: UITableViewController {

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
        let cell = tableView.dequeueReusableCell(withIdentifier: "questions", for: indexPath) as! bookmarksTableViewCell
        
        cell.label1.textColor = self.HEX929292()
        cell.label2.textColor = self.HEX929292()
        cell.label2.text = "Daschund"
        cell.main.text = "What is the most effective way to remove ticks for Daschunds?"

        

        return cell
    }


}
