//
//  notificationsViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 18/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import SJFluidSegmentedControl

class notificationsViewController: UIViewController {
    
    @IBOutlet weak var reminderTable: UITableView!
    
    @IBOutlet weak var notifTable: UITableView!
    
    @IBOutlet weak var segmentedControl: SJFluidSegmentedControl!

    @IBOutlet weak var scrollView: UIScrollView!
    
    var isSwipe = Bool()
    
    let notifType = [1,1,2,2,3,3]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedSetup()
        
        scrollSetup()
        
        reminderTable.tableFooterView = UIView(frame: CGRect.zero)
        
        reminderTable.estimatedRowHeight = 111
        
        reminderTable.rowHeight = UITableViewAutomaticDimension
        
        notifTable.tableFooterView = UIView(frame: CGRect.zero)
        
        notifTable.estimatedRowHeight = 111
        
        notifTable.rowHeight = UITableViewAutomaticDimension
    }
    
    func segmentedSetup() {
        
        segmentedControl.textFont = UIFont(name: "BrandonText-Medium", size: 14.35)!
        segmentedControl.layer.borderColor = self.HEXF0F0F0().cgColor
        segmentedControl.layer.borderWidth = 1
        
        segmentedControl.cornerRadius = 19
    }
    
    func scrollSetup() {
        
        self.scrollView.frame = CGRect(x: 0, y: 121, width: self.view.frame.width, height: 736 - 50 - 121)
        
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width * 2, height: self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        
        self.reminderTable.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: scrollView.frame.size.height)
        self.notifTable.frame = CGRect(x: scrollView.frame.size.width + 6, y: 0, width: self.view.frame.size.width - 12, height: self.view.frame.size.height - 50 - 121)
        
    }

}

extension notificationsViewController: SJFluidSegmentedControlDataSource {
    
    func numberOfSegmentsInSegmentedControl(_ segmentedControl: SJFluidSegmentedControl) -> Int {
        return 2
    }
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl,
                          titleForSegmentAtIndex index: Int) -> String? {
        if index == 0 {
            return "Reminders"
        } else {
            return "Notifications"
        }
    }
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl,
                          gradientColorsForSelectedSegmentAtIndex index: Int) -> [UIColor] {
        switch index {
        case 0:
            return [UIColor(red: 55 / 255.0, green: 167 / 255.0, blue: 132 / 255.0, alpha: 1.0),
                    UIColor(red: 49 / 255.0, green: 148 / 255.0, blue: 117 / 255.0, alpha: 1.0)]
        case 1:
            return [UIColor(red: 227 / 255.0, green: 206 / 255.0, blue: 160 / 255.0, alpha: 1.0),
                    UIColor(red: 225 / 255.0, green: 195 / 255.0, blue: 128 / 255.0, alpha: 1.0)]
        case 2:
            return [UIColor(red: 21 / 255.0, green: 94 / 255.0, blue: 119 / 255.0, alpha: 1.0),
                    UIColor(red: 9 / 255.0, green: 82 / 255.0, blue: 107 / 255.0, alpha: 1.0)]
        default:
            break
        }
        return [.clear]
    }
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl,
                          gradientColorsForBounce bounce: SJFluidSegmentedControlBounce) -> [UIColor] {
        switch bounce {
        case .left:
            return [UIColor(red: 51 / 255.0, green: 149 / 255.0, blue: 182 / 255.0, alpha: 1.0)]
        case .right:
            return [UIColor(red: 9 / 255.0, green: 82 / 255.0, blue: 107 / 255.0, alpha: 1.0)]
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView){
        
        let frame: CGRect = self.scrollView.frame
        let currentLocation = scrollView.contentOffset.y
        
        print("framex:\(frame.origin.x)")
        print("framey:\(frame.origin.y)")
        print("scrollx:\(scrollView.contentOffset.x)")
        print("scrolly:\(scrollView.contentOffset.y)")
        
        if (frame.origin.y - 121) > currentLocation{
            print("Going up!")
        }else if (frame.origin.y - 121) < currentLocation{
            print("Going down!")
        }
        else if frame.origin.x == scrollView.contentOffset.x && isSwipe {
            
            let pageWidth:CGFloat = scrollView.frame.width
            let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
            
            print("here1")
            
            print(currentPage)
            
            if Int(currentPage) == 0{
                
                UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                    
                    self.segmentedControl.currentSegment = 0
                    
                }, completion: nil)
            }
        }
        else if frame.origin.x < scrollView.contentOffset.x && isSwipe {
            
            let pageWidth:CGFloat = scrollView.frame.width
            let currentPage:CGFloat = floor((scrollView.contentOffset.x-pageWidth/2)/pageWidth)+1
            
            print("here2")
            
            print(currentPage)
            
            if Int(currentPage) == 1{
                
                UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
                    
                    self.segmentedControl.currentSegment = 1
                    
                }, completion: nil)
            }
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        
        
        
        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
            
            print("up")
            
            isSwipe = false
        }
        else if targetContentOffset.pointee.y > scrollView.contentOffset.y {
            print("down")
            
            isSwipe = false
        }
        else if targetContentOffset.pointee.x < scrollView.contentOffset.x {
            
            self.isSwipe = true
            let targetOffset = targetContentOffset.pointee.x
            let roundedOffset = round(targetOffset / scrollView.frame.width) * scrollView.frame.width
            targetContentOffset.pointee = CGPoint(x: roundedOffset, y: 0)
        }
        else if targetContentOffset.pointee.x > scrollView.contentOffset.x {
            
            self.isSwipe = true
            let targetOffset = targetContentOffset.pointee.x
            let roundedOffset = round(targetOffset / scrollView.frame.width) * scrollView.frame.width
            targetContentOffset.pointee = CGPoint(x: roundedOffset, y: 0)
        }
    }

}

// MARK: - SJFluidSegmentedControl Delegate Methods

extension notificationsViewController: SJFluidSegmentedControlDelegate {
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl, didChangeFromSegmentAtIndex fromIndex: Int, toSegmentAtIndex toIndex: Int) {
        
        if toIndex == 1 {
            
            let offset = CGPoint(x: self.view.frame.size.width, y: 0)
            self.scrollView.setContentOffset(offset, animated: true)
            
        }
        else{
            
            let offset = CGPoint(x: 0, y: 0)
            self.scrollView.setContentOffset(offset, animated: true)
        }
    }
}
