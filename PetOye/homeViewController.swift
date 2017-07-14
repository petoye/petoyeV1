//
//  homeViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 20/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class homeViewController: UIViewController {

    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialSetup()
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func initialSetup() {
        
        searchView.layer.cornerRadius = 5
        
        searchView.clipsToBounds = true
        
        searchView.layer.contentsScale = UIScreen.main.scale;
        searchView.layer.shadowColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1).cgColor
        searchView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0);
        searchView.layer.shadowRadius = 4.0;
        searchView.layer.shadowOpacity = 0.3;
        searchView.layer.masksToBounds = false;
    }
    
    
    @IBAction func hamburgerButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func messageButtonPressed(_ sender: Any) {
    
        
    }

    @IBAction func bookmarkButtonPressed(_ sender: Any) {
        
        
    }

}
