//
//  basicInfoViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import Toast_Swift

class basicInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var userTypeButton: UIButton!
    
    @IBOutlet weak var basicTable: UITableView!
    
    @IBOutlet weak var petTypeTable: UITableView!
    
    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var username: UITextField!
    
    @IBOutlet weak var petTypeButton: UIButton!
    
    @IBOutlet weak var petTypeLine: UIView!

    @IBOutlet weak var breedButton: UIButton!
    
    @IBOutlet weak var breedLine: UIView!
    
    @IBOutlet weak var breedPicker: UIPickerView!
    
    var userType = ["Pet Parent", "Pet Lover"]
    
    var petType = ["Dog","Cat","Bird","Other"]
    
    var breeds = ["Doberman","Labrador","Corgi","Husky","Golden Retriever"]
    
    var selectedUserType = [true,false]
    
    var selectedPetType = [true,false,false,false]
    
    var images = [#imageLiteral(resourceName: "dog"),#imageLiteral(resourceName: "cat"),#imageLiteral(resourceName: "parrot"),#imageLiteral(resourceName: "rabbit")]
    
    var isUserTypeSelected = false
    
    var isPetTypeSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUserType()
        
        setupSignup()
        
        setupPetType()
        
        setupBreed()
        
        signupButton.isHidden = true
        
        petTypeLine.isHidden = true
        
        petTypeButton.isHidden = true
        
        breedLine.isHidden = true
        
        breedButton.isHidden = true
        
        if let user = UserDefaults.standard.value(forKey: "user_name") as? String {
            
            username.text = user.lowercased().replacingOccurrences(of: " ", with: "_")
        }

        self.hideKeyboardWhenTappedAround()
    }
    
    func setupUserType() {
        
        userTypeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 305, 0, 0)
        
        userTypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        
        basicTable.isHidden = true
        
        petTypeTable.isHidden = true
    }
    
    func setupPetType() {
        
        petTypeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 305, 0, 0)
        
        petTypeButton.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
    }
    
    func setupBreed() {
        
        breedPicker.isHidden = true
    }
    
    func setupSignup() {
        
        signupButton.setTitleColor(self.HEX37A784(), for: .normal)
        
        signupButton.layer.cornerRadius = 31.5
        
        signupButton.clipsToBounds = true
        
        signupButton.layer.borderColor = self.HEX37A784().cgColor
        
        signupButton.layer.borderWidth = 1.3
        
        signupButton.setImage(#imageLiteral(resourceName: "tick"), for: .normal)
        
        signupButton.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 198)
        
        signupButton.imageEdgeInsets = UIEdgeInsetsMake(0, 273, 0, 0)
    }
    
    @IBAction func userTypeButtonPressed(_ sender: Any) {
        
        isUserTypeSelected = false
        
        signupButton.isHidden = true
        
        if !isUserTypeSelected {
            
            userTypeButton.setImage(#imageLiteral(resourceName: "up"), for: .normal)
        }
        else {
            
            userTypeButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
        }
        
        var userT = String()
        
        for i in 0..<selectedUserType.count {
            
            if selectedUserType[i] == true {
                
                userT = userType[i]
            }
        }
        
        userTypeButton.setTitle(userT, for: .normal)
        
        basicTable.isHidden = false
        
        petTypeButton.isHidden = true
        
        petTypeLine.isHidden = true
        
        petTypeTable.isHidden = true
        
        breedPicker.isHidden = true
        
        breedButton.isHidden = true
        
        breedLine.isHidden = true
    }
    
    
    @IBAction func petTypeButtonPressed(_ sender: Any) {
        
        petTypeTable.isHidden = false
        
        isPetTypeSelected = false
        
        if !isPetTypeSelected {
            
            petTypeButton.setImage(#imageLiteral(resourceName: "up"), for: .normal)
        }
        else {
            
            petTypeButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
        }
        
        var userT = String()
        
        for i in 0..<selectedPetType.count {
            
            if selectedPetType[i] == true {
                
                userT = petType[i]
            }
        }
        
        petTypeButton.setTitle(userT, for: .normal)
        
        breedPicker.isHidden = true
        
        breedButton.isHidden = true
        
        breedLine.isHidden = true
        
    }
    
    @IBAction func signupButtonPressed(_ sender: Any) {
        
        breedPicker.isHidden = true
        
        if (username.text?.isEmpty)! {
            
            var style = ToastStyle()
            
            style.messageColor = UIColor.white
            
            style.messageAlignment = .center
            
            style.cornerRadius = 22.5
            
            style.backgroundColor = self.HEX37A784()
            
            style.messageFont = UIFont(name: "Brandon Text", size: 18)!
            
            self.view.makeToast("Fill in the username", duration: 2.0, position: self.giveToastPoint(), style: style)
        }
        else {
            
            // home screen
            
            self.performSegue(withIdentifier: "newUserToHome", sender: self)
        }
    }
    
    @IBAction func breedButtonPressed(_ sender: Any) {
        
        breedPicker.isHidden = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView == basicTable {
            
            return 2
        }
        else {
            
            return 4
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == basicTable {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "basicInfoCell", for: indexPath) as! userTypeTableViewCell
            
            cell.userTypeLabel.text = userType[indexPath.row]
            
            if selectedUserType[indexPath.row] == true {
                    
                 cell.selectIndicator.backgroundColor = self.HEX37A784()
            }
            else {
                
                cell.selectIndicator.backgroundColor = UIColor.clear
            }
            
            cell.selectionStyle = .none
            
            return cell
        }
        else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "petTypeCell", for: indexPath) as! userTypeTableViewCell
            
            cell.userTypeLabel.text = petType[indexPath.row]
            
            cell.smallImage.image = images[indexPath.row]
            
            if selectedPetType[indexPath.row] == true {
                
                cell.selectIndicator.backgroundColor = self.HEX37A784()
            }
            else {
                
                cell.selectIndicator.backgroundColor = UIColor.clear
            }
            
            cell.selectionStyle = .none
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView == basicTable {
            
            for i in 0..<userType.count {
                
                selectedUserType[i] = false
            }
            
            if selectedUserType[indexPath.row] == true {
                
                selectedUserType[indexPath.row] = false
                
            }
            else {
                
                selectedUserType[indexPath.row] = true
            }
            
            userTypeButton.setTitle(userType[indexPath.row], for: .normal)
            
            basicTable.reloadData()
            
            basicTable.isHidden = true
            
            isUserTypeSelected = true
            
            if !isUserTypeSelected {
                
                userTypeButton.setImage(#imageLiteral(resourceName: "up"), for: .normal)
            }
            else {
                
                userTypeButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
            }
            
            if selectedUserType[0] == true {
                
                //pet parent
                
                signupButton.isHidden = true
                
                petTypeButton.isHidden = false
                
                petTypeLine.isHidden = false
            }
            else {
                
                //pet lover
                
                signupButton.isHidden = false
                
                signupButton.frame.origin.y = 273
            }

        }
        else {
            
            for i in 0..<petType.count {
                
                selectedPetType[i] = false
            }
            
            if selectedPetType[indexPath.row] == true {
                
                selectedPetType[indexPath.row] = false
                
            }
            else {
                
                selectedPetType[indexPath.row] = true
            }
            
            petTypeButton.setTitle(petType[indexPath.row], for: .normal)
            
            petTypeTable.reloadData()
            
            petTypeTable.isHidden = true
            
            isPetTypeSelected = true
            
            if !isPetTypeSelected {
                
                petTypeButton.setImage(#imageLiteral(resourceName: "up"), for: .normal)
            }
            else {
                
                petTypeButton.setImage(#imageLiteral(resourceName: "down"), for: .normal)
            }

            breedButton.isHidden = false
            
            breedLine.isHidden = false
            
            breedPicker.isHidden = false
            
        }
        
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return breeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return breeds[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        breedButton.setTitle(breeds[row], for: .normal)
        
        signupButton.isHidden = false
        
        signupButton.frame.origin.y = breedLine.frame.origin.y + 16.5
    }

}
