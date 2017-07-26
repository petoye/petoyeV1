//
//  searchViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 20/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class searchViewController: UIViewController {

    @IBOutlet weak var searchBox: leftPaddedTextField!
    
    @IBOutlet weak var filterButton: UIButton!
    
    @IBOutlet weak var sortByButton: UIButton!
    
    @IBOutlet weak var filterView: UIView!
    
    @IBOutlet weak var overlay: UIView!
    
    @IBOutlet weak var filterTable: UITableView!
    
    @IBOutlet weak var tagsView: UIView!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var tagsTable: UITableView!
    
    @IBOutlet weak var breedView: UIView!
    
    @IBOutlet weak var breedTable: UITableView!
    
    @IBOutlet weak var headerTextBreeds: UILabel!
    
    @IBOutlet weak var resultsTable: UITableView!
    
    var isBreedType = Bool()
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let searchControllerBreed = UISearchController(searchResultsController: nil)
    
    var shouldShowSearchResults = Bool()
    
    var shouldShowSearchResults2 = Bool()
    
    var tags = [Tags]()
    
    var filteredTags = [Tags]()
    
    var breeds = [Tags]()
    
    var filteredBreeds = [Tags]()
    
    var quickFilterForVets = ["Available today", "Rated 4+", "Show nearby (less than 10 kms)", "Dog specialist", "Cat specialist", "Bird specialist"]
    
    var sortByForService = [#imageLiteral(resourceName: "distance"),#imageLiteral(resourceName: "rating"),#imageLiteral(resourceName: "indian-rupee"),#imageLiteral(resourceName: "exp")]
    
    var sortByTitleForService = ["Distance","Rating","Cost","Experience"]
    
    var costForService = ["500-1000","1000-1500","1500+"]
    
    var tagsForService = ["Hip Dislocation","Ticks","Paralysis", "+2"]
    
    var type = [1,2,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBarSetup()
        
        tagsTableSearchBar()
        
        loadTags()
        
        self.hideKeyboardWhenTappedAround()
        
        filterView.isHidden = true
        
        tagsView.isHidden = true
        
        breedView.isHidden = true
        
        filterTable.tableFooterView = UIView(frame: CGRect.zero)
        
        filterTable.estimatedRowHeight = 42
        
        filterTable.rowHeight = UITableViewAutomaticDimension
        
        resultsTable.tableFooterView = UIView(frame: CGRect.zero)
        
        resultsTable.estimatedRowHeight = 42
        
        resultsTable.rowHeight = UITableViewAutomaticDimension
        
        filterTable.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func searchBarSetup() {
        
        searchBox.layer.cornerRadius = 19
        searchBox.clipsToBounds = true
        
        filterButton.layer.cornerRadius = 3.33
        filterButton.clipsToBounds = true
        filterButton.setTitleColor(self.HEX929292(), for: .normal)
        filterButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 5)
        filterButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        
        sortByButton.layer.cornerRadius = 3.33
        sortByButton.clipsToBounds = true
        sortByButton.setTitleColor(self.HEX929292(), for: .normal)
        sortByButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 54, bottom: 0, right: 0)
        sortByButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func filterButtonPressed(_ sender: Any) {
        
        filterViewShow()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        filterViewHide()
    }
    
    @IBAction func sortButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func changeBreedsButtonPressed(_ sender: Any) {
        
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        actionSheetController.addAction(cancelAction)
        
        
        let dogAction = UIAlertAction(title: "Dog breeds", style: .default) { action -> Void in

        }
        actionSheetController.addAction(dogAction)
        
        let catAction = UIAlertAction(title: "Cat breeds", style: .default) { action -> Void in

        }
        actionSheetController.addAction(catAction)
        
        let birdAction = UIAlertAction(title: "Bird breeds", style: .default) { action -> Void in
            
        }
        actionSheetController.addAction(birdAction)
        
        let otherAction = UIAlertAction(title: "Other breeds", style: .default) { action -> Void in
            
        }
        actionSheetController.addAction(otherAction)
        
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    
    @IBAction func backButtonPressedTags(_ sender: Any) {

        tagViewHide(token: 1)
        
        tagViewHide(token: 2)
    }
    
    func filterViewShow() {
        
        resetButton.alpha = 0.4
        
        self.overlay.alpha = 1
        
        self.overlay.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        filterView.frame.origin.y = self.view.frame.size.height
        
        filterView.isHidden = false
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            self.filterView.frame.origin.y = 184
            
        }) { (result) in
        }
    }
    
    func filterViewHide() {
        
        self.overlay.alpha = 0
    
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            self.filterView.frame.origin.y = self.view.frame.size.height
            
        }) { (result) in
        }
    }
    
    func tagViewShow(token: Int) {
        
        self.tagsView.frame.origin.x = self.view.frame.size.width
        self.breedView.frame.origin.x = self.view.frame.size.width
        
        if token == 1 {
            
            tagsView.isHidden = false
            self.tagsTable.reloadData()
        }
        else {
            
            breedView.isHidden = false
            self.breedTable.reloadData()
        }

        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            
            if token == 1 {

                self.tagsView.frame.origin.x = 0
            }
            else {
                
                self.breedView.frame.origin.x = 0
            }

            UIView.animate(withDuration: 0.4, delay: 0.2, options: .curveEaseOut, animations: {
                
                self.filterView.frame.origin.x = -100
                
            }, completion: nil)
            
        }) { (result) in

                self.filterView.isHidden = true
        }
    }
    
    func tagViewHide(token: Int) {
        
        self.tagsView.frame.origin.x = 0
        
        self.filterView.frame.origin.x = 0
        
        self.breedView.frame.origin.x = 0
        
        if token == 1 {
            
            filterView.isHidden = false
            
            self.filterTable.reloadData()
        }
        else {
            
            breedView.isHidden = false
            
            self.breedTable.reloadData()
        }

        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            
            if token == 1 {
                
                self.tagsView.frame.origin.x = self.view.frame.size.width
            }
            else {
                
                self.breedView.frame.origin.x = self.view.frame.size.width
            }

        }) { (result) in
            
            if token == 1 {
                
                self.tagsView.isHidden = true
            }
            else {
                self.breedView.isHidden = true
            }
        }
    }
}

extension searchViewController: UISearchBarDelegate, UISearchResultsUpdating {
    
    func loadTags() {
        
        tags.append(Tags(name: "Hip Dislocation"))
        tags.append(Tags(name: "Paralysis"))
        tags.append(Tags(name: "Ticks"))
        
        breeds.append(Tags(name: "Labrador"))
        breeds.append(Tags(name: "Beagle"))
        breeds.append(Tags(name: "Pug"))
        breeds.append(Tags(name: "Husky"))
    }
    
    func tagsTableSearchBar() {
        
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        //definesPresentationContext = true
        searchController.searchBar.tag = 1
        searchController.searchBar.barTintColor = self.HEXF1F1F1()
        searchController.searchBar.layer.borderColor = self.HEXF1F1F1().cgColor
        searchController.searchBar.layer.borderWidth = 1
        searchController.searchBar.placeholder = "Search tags"
        searchController.searchBar.tintColor = self.HEX37A784()
        tagsTable.tableHeaderView = searchController.searchBar
        
        searchControllerBreed.searchResultsUpdater = self
        searchControllerBreed.hidesNavigationBarDuringPresentation = false
        searchControllerBreed.dimsBackgroundDuringPresentation = false
        searchControllerBreed.searchBar.delegate = self
        //definesPresentationContext = true
        searchControllerBreed.searchBar.tag = 2
        searchControllerBreed.searchBar.barTintColor = self.HEXF1F1F1()
        searchControllerBreed.searchBar.layer.borderColor = self.HEXF1F1F1().cgColor
        searchControllerBreed.searchBar.layer.borderWidth = 1
        searchControllerBreed.searchBar.placeholder = "Search breeds"
        searchControllerBreed.searchBar.tintColor = self.HEX37A784()
        breedTable.tableHeaderView = searchControllerBreed.searchBar
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchBar.tag == 1 {
            
            shouldShowSearchResults = true
            tagsTable.reloadData()
        }
        else {
            
            shouldShowSearchResults2 = true
            breedTable.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.tag == 1 {
            
            searchController.searchBar.resignFirstResponder()
            shouldShowSearchResults = false
            tagsTable.reloadData()
        }
        else {
            
            searchControllerBreed.searchBar.resignFirstResponder()
            shouldShowSearchResults2 = false
            breedTable.reloadData()
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if searchBar.tag == 1 {
            
            if !shouldShowSearchResults {
                shouldShowSearchResults = true
                tagsTable.reloadData()
            }
            searchController.searchBar.resignFirstResponder()
        }
        else {
            if !shouldShowSearchResults2 {
                shouldShowSearchResults2 = true
                breedTable.reloadData()
            }
            searchControllerBreed.searchBar.resignFirstResponder()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if searchController.searchBar.tag == 1 {
            
            let searchString = searchController.searchBar.text
            
            filteredTags = tags.filter({ (user) -> Bool in
                let username: NSString = user.name as NSString
                
                return (username.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
            })
            tagsTable.reloadData()
            
        }
        else {
            
            let searchString = searchController.searchBar.text
            
            filteredBreeds = breeds.filter({ (user) -> Bool in
                let username: NSString = user.name as NSString
                
                return (username.range(of: searchString!, options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
            })
            breedTable.reloadData()
        }
    }
}
