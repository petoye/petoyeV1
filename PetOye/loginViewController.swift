//
//  loginViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

import Toast_Swift

class loginViewController: UIViewController {
    
    @IBOutlet weak var fbButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var midView: UIView!
    
    @IBOutlet weak var forgotButton: UIButton!
    
    @IBOutlet weak var tsLabel: UILabel!
    
    @IBOutlet weak var registerQuestionLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var emailTextfield: UITextField!
    
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBOutlet weak var emailLine: UIView!
    
    @IBOutlet weak var passwordLine: UIView!
    
    @IBOutlet weak var confirmTextfield: UITextField!
    
    @IBOutlet weak var confirmLine: UIView!
    
    var isNew = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fbButtonSetup()
        
        loginButtonSetup()
        
        tsLabel.isHidden = true
        
        confirmTextfield.isHidden = true
        
        confirmLine.isHidden = true
        
        if isNew {
            
            initialSetupForNewUser()
        }
        
        self.hideKeyboardWhenTappedAround()
    }
    
    func fbButtonSetup() {
        
        fbButton.backgroundColor = self.colorFB()
        
        fbButton.setTitleColor(UIColor.white, for: .normal)
        
        fbButton.setImage(#imageLiteral(resourceName: "fb"), for: .normal)
        
        fbButton.layer.cornerRadius = 31.5
        
        fbButton.clipsToBounds = true
        
        fbButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 107)
        
        fbButton.imageEdgeInsets = UIEdgeInsetsMake(0, 298, 0, 0)
        
    }
    
    func loginButtonSetup() {
        
        loginButton.setTitleColor(self.HEX57A784(), for: .normal)
        
        loginButton.layer.cornerRadius = 31.5
        
        loginButton.clipsToBounds = true
        
        loginButton.layer.borderColor = self.HEX57A784().cgColor
        
        loginButton.layer.borderWidth = 1.3
        
        loginButton.setImage(#imageLiteral(resourceName: "tick"), for: .normal)
        
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 245)
        
        loginButton.imageEdgeInsets = UIEdgeInsetsMake(0, 273, 0, 0)
        
    }
    
    func initialSetupForNewUser() {
        
        welcomeLabel.text = "Register"
        
        fbButton.isHidden = true
        
        orLabel.isHidden = true
        
        loginButton.setTitle("Sign me up!", for: .normal)
        
        loginButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 198)
        
        midView.frame.origin.y = 158
        
        forgotButton.frame.origin.y += 32
        
        forgotButton.setTitle("Terms of Service & Privacy Policy", for: .normal)
        
        tsLabel.isHidden = false
        
        tsLabel.frame.origin.y = forgotButton.frame.origin.y - 23
        
        registerQuestionLabel.text = "Already Registered?"
        
        registerButton.setTitle("Log in here", for: .normal)
        
        registerButton.frame.size.width = 81
        
        emailTextfield.frame.origin.y -= 50
        
        emailLine.frame.origin.y -= 50
        
        passwordTextfield.frame.origin.y -= 50
        
        passwordLine.frame.origin.y -= 50
        
        confirmPassword()
    }
    
    func confirmPassword() {
        
        confirmTextfield.isHidden = false
        
        confirmLine.isHidden = false
        
        confirmTextfield.frame.origin.y = passwordLine.frame.origin.y + 15
        
        confirmLine.frame.origin.y = confirmTextfield.frame.origin.y + 38
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        
        if isNew {
            
            //sign up new user
            
            if ((emailTextfield.text?.isEmpty)! || (passwordTextfield.text?.isEmpty)!) || (confirmTextfield.text?.isEmpty)! {
                
                
                //show message some field blank
                
                var style = ToastStyle()
                
                style.messageColor = UIColor.white
                
                style.messageAlignment = .center
                
                style.cornerRadius = 22.5
                
                style.backgroundColor = self.HEX57A784()
                
                style.messageFont = UIFont(name: "Brandon Text", size: 18)!
                
                self.view.makeToast("Fill in all the details", duration: 2.0, position: self.giveToastPoint(), style: style)
                
            }
            else {

                let comment = checkIfValid(email: emailTextfield.text!, pass1: passwordTextfield.text!, pass2: confirmTextfield.text!).1
                
                if checkIfValid(email: emailTextfield.text!, pass1: passwordTextfield.text!, pass2: confirmTextfield.text!).0 {
                    
                    //api call
                    
                    self.performSegue(withIdentifier: "basicInfo", sender: self)
                }
                else {
                    
                    //show error message
                    
                    var style = ToastStyle()
                    
                    style.messageColor = UIColor.white
                    
                    style.messageAlignment = .center
    
                    style.cornerRadius = 22.5
                    
                    style.backgroundColor = self.HEX57A784()
                    
                    style.messageFont = UIFont(name: "Brandon Text", size: 18)!
                    
                    self.view.makeToast(comment, duration: 2.0, position: self.giveToastPoint(), style: style)
                }

                
                
            }
            
        }
        else {
            
            //old user login
            
            self.performSegue(withIdentifier: "oldUserToHome", sender: self)
        }
    }
    
    func checkIfValid(email: String, pass1: String, pass2: String) -> (Bool,String) {
        
        var isValid = Bool()
        
        var comment = ""
        
        if email.contains("@") && email.contains(".") {
            
            // email valid
            
            if pass1.characters.count < 6 {
                
                comment = "Password must be atleast 6 letters or more"
            }
            else {
                
                if pass1 == pass2 {
                    
                    // passwords match
                    
                    isValid = true
                }
                else {
                    
                    // dont match
                    
                    isValid = false
                    
                    comment = "Passwords don't match"
                }

                
            }
            
        }
        else {
            
            // email not valid
            
            isValid = false
            
            comment = "Invalid email"
        }
        
        return (isValid,comment)
    }
    

}
