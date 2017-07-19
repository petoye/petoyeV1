//
//  allChatsViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 15/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class allChatsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var allChatsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        allChatsTable.tableFooterView = UIView(frame: CGRect.zero)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .default
    }

    
    @IBAction func backPressed(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! chatTableViewCell
        
        cell.name.text = "Ameya Vichare"
        cell.type.text = "Service"
        cell.type2.text = "Vet"
        cell.date.text = "23/07/2017"
        cell.eta.text = "in 3 days"
        
        cell.type.textColor = self.HEXBBCED3()
        cell.type2.textColor = self.HEXBBCED3()
        cell.date.textColor = self.HEXBBCED3()
        cell.eta.textColor = self.HEXBBCED3()
        
        cell.pic.layer.cornerRadius = 31
        cell.pic.clipsToBounds = true
        
        cell.width1.constant = self.box(text: "Service", fontSize: 13, fontName: "Source Sans Pro").0
        cell.width2.constant = self.box(text: "Vet", fontSize: 13, fontName: "Source Sans Pro").0
        cell.width3.constant = self.box(text: "23/07/2017", fontSize: 13, fontName: "Source Sans Pro").0
        
        cell.separator1.frame.origin.x = cell.type.frame.origin.x + cell.width1.constant + 3
        cell.separator2.frame.origin.x = cell.type2.frame.origin.x + cell.width2.constant + 1
        
        cell.separator1.frame.origin.y = 63
        cell.separator2.frame.origin.y = 63
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "allChatsToMain", sender: self)
    }

}
