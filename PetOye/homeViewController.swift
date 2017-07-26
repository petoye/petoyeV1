//
//  homeViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 20/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class homeViewController: UIViewController, UITextFieldDelegate, UIScrollViewDelegate {

    @IBOutlet weak var searchView: UIView!
    
    @IBOutlet weak var hamButton: UIBarButtonItem!
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    
    @IBOutlet weak var bookmarkButton: UIButton!
    
    @IBOutlet weak var searchBar: UITextField!
    
    @IBOutlet weak var closeButton: UIButton!
    
    @IBOutlet weak var recentSearchtTable: UITableView!
    
    let nearbyContent = ["Vets","Groomers","Trainers","Walkers","Behaviorists","Day Care","Boarding","Foster Homes","Cafes"]
    
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
        
        searchBar.delegate = self
        
        closeButton.isHidden = true
        
        recentSearchtTable.isHidden = true
        
        recentSearchtTable.tableFooterView = UIView(frame: CGRect.zero)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(homeViewController.keyboardWillHide(notification:)),
                                               name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        recentSearchtTable.layer.contentsScale = UIScreen.main.scale;
        recentSearchtTable.layer.shadowColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 1).cgColor
        recentSearchtTable.layer.shadowOffset = CGSize(width: 0.0, height: 5.0);
        recentSearchtTable.layer.shadowRadius = 4.0;
        recentSearchtTable.layer.shadowOpacity = 0.3;
        recentSearchtTable.layer.masksToBounds = false;
        
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
    }

    func keyboardWillHide(notification: NSNotification) {
        if let _ = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            
//            searchBar.text = ""
//            
//            closeButton.isHidden = true
//            bookmarkButton.isHidden = false
//            
//            recentSearchtTable.isHidden = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        closeButton.isHidden = false
        bookmarkButton.isHidden = true
        
        recentSearchtTable.isHidden = false
    }

    @IBAction func hambugerButtonPressed(_ sender: Any) {
            
        self.performSegue(withIdentifier: "bookmarks", sender: self)
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        
        searchBar.resignFirstResponder()
        searchBar.text = ""
        
        closeButton.isHidden = true
        bookmarkButton.isHidden = false
        
        recentSearchtTable.isHidden = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        searchBar.resignFirstResponder()
    }
    
}
