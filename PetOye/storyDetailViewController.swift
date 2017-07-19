//
//  storyDetailViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class storyDetailViewController: UIViewController, backButtonInStory {

    @IBOutlet weak var storyTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = self.HEXF8F8F8()
        
        storyTable.estimatedRowHeight = 250
        
        storyTable.rowHeight = UITableViewAutomaticDimension
        
        storyTable.backgroundColor = self.HEXF8F8F8()
        
        storyTable.separatorStyle = .none
        
        storyTable.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 48))
    }
    
    func backButtonPressed() {
        
        _ = self.navigationController?.popViewController(animated: true)
    }

}

extension storyDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "storyHeader", for: indexPath) as! storyHeaderTableViewCell
            cell.delegate = self
            cell.backgroundColor = self.HEXF8F8F8()
            cell.title.text = "Dog vs Parents"
            cell.time.text = "8 minute read"
            cell.time.textColor = self.HEX929292()
            
            cell.date.text = "APRIL 17, 2017"
            cell.author.text = "by Sarika Karnad"
            
            cell.selectionStyle = .none
            return cell
        }
        else if indexPath.row == 1 || indexPath.row == 3 {
            
            var identifier = String()
            
            if indexPath.row == 1 {
                
                identifier = "storyLeft"
            }
            else {
                
                identifier = "storyRight"
            }
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! storyLeftRightTableViewCell
            
            cell.backgroundColor = self.HEXF8F8F8()
            cell.article.text = "We've both always loved dogs a lot, but according to our family traditions, we're not supposed to keep dogs in the house. When we decided to get a dog home, we told my mother-in-law but didn’t even mention it to my father-in-law. We knew he wouldn’t allow it. After we got Rony home, it was an uphill climb as my mother-in-law never really accepted him and my father-in-law was absolutely against him. He said that Rony cannot stay in the same house as him but we told him that if Rony goes, we go too."
            
            cell.selectionStyle = .none
            return cell
            
        }
        else if indexPath.row == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "next", for: indexPath) as! readNextTableViewCell
            cell.backgroundColor = self.HEXF8F8F8()
            cell.pic.image = #imageLiteral(resourceName: "next.png")
            cell.overlay.backgroundColor = self.HEX67AEC3()
            
            cell.title.text = "Tips on pet adoption for cats"
            cell.readNext.text = "READ NEXT"
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "quote", for: indexPath) as! quoteTableViewCell
            cell.backgroundColor = self.HEXF8F8F8()
            cell.quote.text = "\"He said that Rony cannot stay in the same house as him but we told him that if Rony goes, we go too.\""
            
            return cell
            
            
        }
        
    }
    
    
}

