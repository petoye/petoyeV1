//
//  bookmarkViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 15/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import PageMenu

class bookmarkViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    
    var controllerArray : [UIViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tabSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    func tabSetup() {

        let controller1 = storyboard?.instantiateViewController(withIdentifier: "serviceBookmark") as! serviceInBookmarkTableViewController
        controller1.title = "Services"
        controllerArray.append(controller1)
        
        let controller2 = storyboard?.instantiateViewController(withIdentifier: "questionBookmark") as! questionsInBookmarkTableViewController
        controller2.title = "Questions"
        controllerArray.append(controller2)
        
        let controller3 = storyboard?.instantiateViewController(withIdentifier: "placesBookmark") as! placesInBookmarkTableViewController
        controller3.title = "Places"
        controllerArray.append(controller3)
        
        let controller4 = storyboard?.instantiateViewController(withIdentifier: "adoptionsBookmark") as! adoptionInBookmarksTableViewController
        controller4.title = "Adoptions"
        controllerArray.append(controller4)
        
        let controller5 = storyboard?.instantiateViewController(withIdentifier: "eventsBookmark") as! eventsInBookmarksTableViewController
        controller5.title = "Events"
        controllerArray.append(controller5)
        
        let parameters: [CAPSPageMenuOption] = [
            .scrollMenuBackgroundColor(UIColor.white),
            .viewBackgroundColor(UIColor.white),
            .selectionIndicatorColor(self.HEX37A784()),
            .bottomMenuHairlineColor(self.HEXF0F0F0()),
            .menuItemFont(UIFont(name: "BrandonText-Medium", size: 14.0)!),
            .menuHeight(40.0),
            .menuItemWidth(80.0),
            .centerMenuItems(false),
            .selectedMenuItemLabelColor(self.HEX37A784()),
            .unselectedMenuItemLabelColor(self.HEX929292())
        ]
        
        // Initialize scroll menu
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 64.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        self.addChildViewController(pageMenu!)
        self.view.addSubview(pageMenu!.view)
        
        pageMenu!.didMove(toParentViewController: self)
    }

    override func shouldAutomaticallyForwardRotationMethods() -> Bool {
        return true
    }
    
    @IBAction func backPressed(_ sender: Any) {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    

}
