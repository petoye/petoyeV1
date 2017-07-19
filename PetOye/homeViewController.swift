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
    
    @IBOutlet weak var hamButton: UIBarButtonItem!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
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
        
        hamButton.target = revealViewController()
        hamButton.action = #selector(SWRevealViewController.revealToggle(_:))
        
        revealViewController().rearViewRevealWidth = self.view.frame.size.width - 49
        
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        navigationBar.tintColor = UIColor.clear
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    
    @IBAction func hamburgerButtonPressed(_ sender: Any) {
        
        
    }
    
    @IBAction func messageButtonPressed(_ sender: Any) {
    
        
    }

    @IBAction func bookmarkButtonPressed(_ sender: Any) {
        
        
    }

}
