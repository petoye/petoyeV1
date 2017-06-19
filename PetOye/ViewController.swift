//
//  ViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 13/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var tutorialScroll: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var nextPress: UIButton!
    
    @IBOutlet weak var textDesc: UILabel!
    
    @IBOutlet weak var tutVideo: UIView!
    
    var player: AVPlayer!
    
    var avpController = AVPlayerViewController()
    
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        tutorialSlider()
        
        videoPlayer()
        
        playVid()
    }
    
    
    
    func tutorialSlider() {
        
        //initial config
        
        self.tutorialScroll.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        let scrollViewWidth = self.tutorialScroll.frame.width
        
        let scrollViewHeight = self.tutorialScroll.frame.height
        
        self.tutorialScroll.contentSize = CGSize(width: scrollViewWidth * 4, height: scrollViewWidth)
        
        self.tutorialScroll.delegate = self
        
        self.tutorialScroll.isPagingEnabled = true
        
        self.pageControl.currentPage = 0
        
        self.tutorialScroll.bounces = false
        
        pageControl.addTarget(self, action: #selector(changePage(sender:)), for: UIControlEvents.valueChanged)

        //adding images to scroll
        
        let imgOne = UIImageView(frame: CGRect(x: 0, y: 0,width: scrollViewWidth, height: scrollViewHeight))
        imgOne.image = #imageLiteral(resourceName: "tut1")
        
        let imgTwo = UIImageView(frame: CGRect(x: scrollViewWidth, y: 0,width: scrollViewWidth , height: scrollViewHeight))
        imgTwo.image = #imageLiteral(resourceName: "tut2")
        
        let imgThree = UIImageView(frame: CGRect(x: scrollViewWidth*2, y: 0,width: scrollViewWidth, height: scrollViewHeight))
        imgThree.image = #imageLiteral(resourceName: "tut3")
        
        let imgFour = UIImageView(frame: CGRect(x: scrollViewWidth*3, y: 0,width: scrollViewWidth, height: scrollViewHeight))
        imgFour.image = #imageLiteral(resourceName: "tut4")
        
        self.tutorialScroll.addSubview(imgOne)
        self.tutorialScroll.addSubview(imgTwo)
        self.tutorialScroll.addSubview(imgThree)
        self.tutorialScroll.addSubview(imgFour)

    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * tutorialScroll.frame.size.width
        tutorialScroll.setContentOffset(CGPoint(x : x, y : 0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
        
        let pageWidth:CGFloat = tutorialScroll.frame.width
        
        let currentPage:CGFloat = floor((tutorialScroll.contentOffset.x-pageWidth/2)/pageWidth)+1
        
        self.pageControl.currentPage = Int(currentPage)
        
        playVid()
        
        if Int(currentPage) == 0{
            
            textDesc.text = "Pocket friendly pet-care"
            
        }else if Int(currentPage) == 1{

            textDesc.text = "Hassle free adoptions"
        }
        else if Int(currentPage) == 2{
            
            textDesc.text = "Hundreds of pet care options"
        }
        else {
            
            textDesc.text = "Get your queries answered"
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let targetOffset = targetContentOffset.pointee.x
        let roundedOffset = round(targetOffset / scrollView.frame.width) * tutorialScroll.frame.width
        
        if pageControl.currentPage != 3 {
            
            print("yes")
            
            print(pageControl.currentPage)
            
            targetContentOffset.pointee = CGPoint(x: roundedOffset, y: 0)
            
                    }
        else {
                
//                textDesc.text = "Pocket friendly pet-care"
        }
        
    }

    
    
    @IBAction func nextButton(_ sender: Any) {
        
        playVid()
        
        count = pageControl.currentPage + 1

        self.pageControl.currentPage = count
        
        print(pageControl.currentPage)
        
        if count < 4 {
            
            tutorialScroll.contentOffset = CGPoint(x: self.view.frame.size.width * CGFloat(pageControl.currentPage), y: 0)
        }
        else if count == 4 {
            
            self.performSegue(withIdentifier: "tutorialToIntro", sender: self)
            
//            tutorialScroll.contentOffset = CGPoint(x: 0, y: 0)
//            
//            self.pageControl.currentPage = 0
//            
//            count = 0
        }
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func videoPlayer() {
        
        let moviePath = Bundle.main.path(forResource: "tutSample1", ofType: "mov")
        
        if let path = moviePath{
            let url = NSURL.fileURL(withPath: path)
            let item = AVPlayerItem(url: url)
            self.player = AVPlayer(playerItem: item)
            self.avpController = AVPlayerViewController()
            self.avpController.player = self.player
            avpController.showsPlaybackControls = false
            avpController.view.frame = tutVideo.frame
            self.addChildViewController(avpController)
            self.view.addSubview(avpController.view)
        }
        
        
    }
    
    func playVid() {
        
        print("playing")
        
        avpController.player?.seek(to: kCMTimeZero)
        
        avpController.player?.play()
        
    }
    

}

