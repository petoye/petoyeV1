//
//  exploreViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 16/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import SJFluidSegmentedControl
import AVFoundation

class exploreViewController: UIViewController {
    
    @IBOutlet weak var pic: UIImageView!
    
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var header: UIButton!
    
    @IBOutlet weak var separator: UIView!
    
    @IBOutlet weak var headerSeparator: UIView!
    
    @IBOutlet weak var segmentedControl: SJFluidSegmentedControl!

    @IBOutlet weak var exploreTable: UITableView!
    
    @IBOutlet weak var storiesCollection: UICollectionView!
    
    @IBOutlet weak var askView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    var type = [1,2,3,4,5,6,7,8,9]
    
    var isSwipe = Bool()
    
    var photos = [#imageLiteral(resourceName: "i1.png"),#imageLiteral(resourceName: "tut4"),#imageLiteral(resourceName: "tut1"),#imageLiteral(resourceName: "i1.png"),#imageLiteral(resourceName: "tut2"),#imageLiteral(resourceName: "tut3"),#imageLiteral(resourceName: "tut4"),#imageLiteral(resourceName: "i1.png"),#imageLiteral(resourceName: "tut3"),#imageLiteral(resourceName: "tut2")]
    
    override func viewDidLoad() {
        
        if let layout = storiesCollection?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        segmentedSetup()
        
        headerSetup()
        
        scrollViewSetup()
        
        exploreTable.tableFooterView = UIView(frame: CGRect.zero)
        
        exploreTable.estimatedRowHeight = 111
        
        exploreTable.rowHeight = UITableViewAutomaticDimension
    }
    
    func segmentedSetup() {
        
        segmentedControl.textFont = UIFont(name: "BrandonText-Medium", size: 14.35)!
        segmentedControl.layer.borderColor = self.HEXF0F0F0().cgColor
        segmentedControl.layer.borderWidth = 1
    }
    
    func headerSetup() {
        
        pic.image = #imageLiteral(resourceName: "demo.jpg")
        pic.layer.cornerRadius = 10
        pic.clipsToBounds = true
        name.text = "Ameya Vichare"
        
        header.setTitle("What is your question/recommendation?", for: .normal)
        header.setTitleColor(self.HEX929292(), for: .normal)
        separator.backgroundColor = self.HEXF1F1F1()
        headerSeparator.backgroundColor = self.HEXF1F1F1()
    }
    
    func scrollViewSetup() {
        
        self.scrollView.frame = CGRect(x: 0, y: 121, width: self.view.frame.width, height: 736 - 50 - 121 - 69)

        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.width * 2, height: self.scrollView.frame.height)
        self.scrollView.delegate = self
        self.scrollView.isPagingEnabled = true
        
        self.exploreTable.frame = CGRect(x: 0, y: 69, width: self.view.frame.size.width, height: scrollView.frame.size.height)
        self.storiesCollection.frame = CGRect(x: scrollView.frame.size.width + 6, y: 0, width: self.view.frame.size.width - 12, height: self.view.frame.size.height - 50 - 121)
        
//        discoverTableX.constant = 414
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

extension exploreViewController: SJFluidSegmentedControlDataSource {
    
    func numberOfSegmentsInSegmentedControl(_ segmentedControl: SJFluidSegmentedControl) -> Int {
        return 2
    }
    
    func segmentedControl(_ segmentedControl: SJFluidSegmentedControl,
                          titleForSegmentAtIndex index: Int) -> String? {
        if index == 0 {
            return "Feed"
        } else {
            return "Stories & Tips"
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
    
}

// MARK: - SJFluidSegmentedControl Delegate Methods

extension exploreViewController: SJFluidSegmentedControlDelegate {
    
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

extension exploreViewController : PinterestLayoutDelegate {
    // 1
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let photo = photos[indexPath.item]
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: photo.size, insideRect: boundingRect)
        return rect.size.height
    }
    
    // 2
    func collectionView(collectionView: UICollectionView,
                        heightForAnnotationAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let annotationPadding = CGFloat(4)
        let annotationHeaderHeight = CGFloat(17)
        
        
        let height = CGFloat(35)//annotationPadding + annotationHeaderHeight + annotationPadding
        return height
    }
}


