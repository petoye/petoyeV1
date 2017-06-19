//
//  introViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 18/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class introViewController: UIViewController {
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBOutlet weak var fbButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailButtonSetUp()
        
        fbButtonSetUp()
    }
    
    func emailButtonSetUp() {
        
        emailButton.layer.cornerRadius = 31.5
        
        emailButton.clipsToBounds = true
        
        emailButton.layer.borderColor = UIColor.black.cgColor
        
        emailButton.layer.borderWidth = 1.31
        
        emailButton.setImage(#imageLiteral(resourceName: "emailIcon"), for: .normal)
        
        emailButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 265)
        
        emailButton.imageEdgeInsets = UIEdgeInsetsMake(0, 285, 0, 0)
        
    }
    
    func fbButtonSetUp() {
        
        fbButton.backgroundColor = self.colorFB()
        
        fbButton.setTitleColor(UIColor.white, for: .normal)
        
        fbButton.setImage(#imageLiteral(resourceName: "fb"), for: .normal)
        
        fbButton.layer.cornerRadius = 31.5
        
        fbButton.clipsToBounds = true
        
        fbButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 218)
        
        fbButton.imageEdgeInsets = UIEdgeInsetsMake(0, 298, 0, 0)
        
    }

    @IBAction func emailButtonPressed(_ sender: Any) {
        
        self.performSegue(withIdentifier: "newUserRegister", sender: self)
    }
    
    @IBAction func fbButtonPressed(_ sender: Any) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newUserRegister" {
            
            let vc = segue.destination as! loginViewController
            
            vc.isNew = true
        }
    }
    
}
