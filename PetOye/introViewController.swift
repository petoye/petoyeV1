//
//  introViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 18/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class introViewController: UIViewController {
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBOutlet weak var fbButton: UIButton!
    
    var fbLoginSuccess = Bool()
    
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
        
        fbLogin()
    }
    
    func fbLogin() {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        
        fbLoginManager.logIn(withReadPermissions: ["email","user_friends"], from: self) { (result, error) -> Void in
            if (error == nil){
                
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                
                if(fbloginresult.grantedPermissions != nil && fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getMoreDetails()
                    self.fbLoginSuccess = true
                }
            }
        }
    }
    
    func getMoreDetails() {
        
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email,age_range"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    let fbDetails = result as! NSDictionary
                    print(fbDetails)
                    
                    let user_email = fbDetails["email"]! as! String
                    _ = fbDetails["first_name"]!
                    let username = fbDetails["name"]! as! String
                    let profilepic_url = fbDetails["picture"] as! NSDictionary
                    let url = profilepic_url["data"]! as! NSDictionary
                    let profUrl = url["url"]! as! String
                    let fbid = fbDetails["id"]! as! String
                    let minage = fbDetails["age_range"] as! NSDictionary
                    let age = minage["min"]!

                    print(user_email)
                    print(username)
                    print(profUrl)
                    print(fbid)
                    print(age)
                    
                    UserDefaults.standard.set(fbid, forKey: "user_fbid")
                    UserDefaults.standard.set(user_email, forKey: "user_email")
                    UserDefaults.standard.set(username, forKey: "user_name")
                    UserDefaults.standard.set(profUrl, forKey: "user_picurl")
                    
                    //need to test
                    
                    FBSDKGraphRequest(graphPath: "\(fbid)/friends?fields=name,picture,id", parameters: nil).start(completionHandler: { (connection, result, error) in
                        
                        if error == nil {
                            
                            let friendList = result as! NSDictionary
                            print(friendList)
                        }
                    })
                    
                    self.performSegue(withIdentifier: "newUserRegister", sender: self)
                }
            })
        }
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "newUserRegister" {
            
            let vc = segue.destination as! loginViewController
            
            vc.isNew = true
        }
    }
    
}
