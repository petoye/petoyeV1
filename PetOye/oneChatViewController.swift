//
//  oneChatViewController.swift
//  PetOye
//
//  Created by Ameya Vichare on 15/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit
import JSQMessagesViewController

var messages = [JSQMessage]()
var outgoingBubbleImageView: JSQMessagesBubbleImage!
var incomingBubbleImageView: JSQMessagesBubbleImage!

class oneChatViewController: JSQMessagesViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetup()
        
        initialSetup()
        
        setupBubbles()
        
        messages.removeAll()
        
        demoMessages()
    }
    
    func initialSetup() {
        
        self.senderId = "1"
        self.senderDisplayName = "Ameya"
        self.navigationController?.navigationBar.isHidden = true
        
        collectionView!.collectionViewLayout.incomingAvatarViewSize = CGSize(width: 24, height: 24)
        collectionView!.collectionViewLayout.outgoingAvatarViewSize = CGSize(width: 24, height: 24)
        collectionView.collectionViewLayout.messageBubbleFont = UIFont(name: "Source Sans Pro", size: 14.0)
        self.collectionView.backgroundColor = self.HEXF1F1F1()
        
//        self.inputToolbar.preferredDefaultHeight = 72.0
        self.inputToolbar.contentView.textView.placeHolder = "Tap to Chat..."
        self.inputToolbar.contentView.textView.textColor = UIColor.black
        self.inputToolbar.contentView.textView.font = UIFont(name: "Source Sans Pro", size: 14.0)
        
        self.inputToolbar.contentView.rightBarButtonItem.setTitleColor(self.HEX37A784(), for: .highlighted)
        
        self.inputToolbar.contentView.rightBarButtonItem.setTitleColor(self.HEX37A784(), for: UIControlState.normal)
        
        self.inputToolbar.contentView.backgroundColor = UIColor.white
        
        self.inputToolbar.contentView.textView.layer.borderWidth = 0.0

        self.inputToolbar.contentView.leftBarButtonItem.setImage(#imageLiteral(resourceName: "chatMessage"), for: .normal)
        self.inputToolbar.contentView.leftBarButtonItem.isEnabled = false
        
        self.inputToolbar.contentView.rightBarButtonItem.setImage(#imageLiteral(resourceName: "send"), for: .normal)
        
        self.inputToolbar.contentView.rightBarButtonItem.setTitle("", for: .normal)
        
        self.topContentAdditionalInset = 81.5
    }
    
    func demoMessages() {
        
        let msg1 = JSQMessage(senderId: "2", displayName: "Anon", text: "What all services do you provide?")
        
        messages.append(msg1!)
        
        let msg2 = JSQMessage(senderId: "1", displayName: "Anon", text: "Grooming, Training etc.")
        
        messages.append(msg2!)
        
        let msg3 = JSQMessage(senderId: "2", displayName: "Anon", text: "That's awesome!")
        
        messages.append(msg3!)
    }
    
    func navigationBarSetup() {
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: 414, height: 99))
        navBar.barTintColor = self.HEX37A784()
        navBar.isTranslucent = false
        navBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.view.addSubview(navBar);
        
        let back = UIButton(frame: CGRect(x: 5, y: 50, width: 33.5, height: 33.5))
        back.addTarget(self, action: #selector(backPressed), for: .touchUpInside)
        back.setImage(#imageLiteral(resourceName: "backWhite"), for: .normal)
        navBar.addSubview(back)
        
        let name = UILabel(frame: CGRect(x: 59, y: 44, width: 213, height: 25))
        name.text = "Ameya Vichare"
        name.font = UIFont(name: "Source Sans Pro", size: 20)
        name.textColor = UIColor.white
        navBar.addSubview(name)
        
        let typeWidth = self.box(text: "Service", fontSize: 13, fontName: "Source Sans Pro").0
        
        let type = UILabel(frame: CGRect(x: 59, y: 70, width: typeWidth, height: 17))
        type.text = "Service"
        type.font = UIFont(name: "Source Sans Pro", size: 13)
        type.textColor = self.HEXAEDBCD()
        navBar.addSubview(type)
        
        let type2Width = self.box(text: "Vet", fontSize: 13, fontName: "Source Sans Pro").0
        
        let type2 = UILabel(frame: CGRect(x: type.frame.origin.x + typeWidth + 9.5, y: 70, width: type2Width, height: 17))
        type2.text = "Vet"
        type2.font = UIFont(name: "Source Sans Pro", size: 13)
        type2.textColor = self.HEXAEDBCD()
        navBar.addSubview(type2)
        
        let dateWidth = self.box(text: "23/07/2017", fontSize: 13, fontName: "Source Sans Pro").0
        
        let date = UILabel(frame: CGRect(x: type2.frame.origin.x + type2Width + 9.5, y: 70, width: dateWidth, height: 17))
        date.text = "23/07/2017"
        date.font = UIFont(name: "Source Sans Pro", size: 13)
        date.textColor = self.HEXAEDBCD()
        navBar.addSubview(date)
        
        let sep1 = UIImageView(frame: CGRect(x: type2.frame.origin.x - 6.5, y: 78.3, width: 3.5, height: 3.5))
        sep1.image = #imageLiteral(resourceName: "whiteSeparator")
        navBar.addSubview(sep1)
        
        let sep2 = UIImageView(frame: CGRect(x: date.frame.origin.x - 6.5, y: 78.3, width: 3.5, height: 3.5))
        sep2.image = #imageLiteral(resourceName: "whiteSeparator")
        navBar.addSubview(sep2)
        
        let call = UIButton(frame: CGRect(x: 271.5, y: 43.5, width: 30, height: 30))
        call.addTarget(self, action: #selector(callPressed), for: .touchUpInside)
        call.setImage(#imageLiteral(resourceName: "phone-call"), for: .normal)
        navBar.addSubview(call)
        
        let calendar = UIButton(frame: CGRect(x: 306, y: 43.5, width: 30, height: 30))
        calendar.addTarget(self, action: #selector(calendarPressed), for: .touchUpInside)
        calendar.setImage(#imageLiteral(resourceName: "calendar"), for: .normal)
        navBar.addSubview(calendar)
        
        let profile = UIButton(frame: CGRect(x: 340, y: 43, width: 30, height: 30))
        profile.addTarget(self, action: #selector(profilePressed), for: .touchUpInside)
        profile.setImage(#imageLiteral(resourceName: "profile"), for: .normal)
        navBar.addSubview(profile)
        
        let more = UIButton(frame: CGRect(x: 373.5, y: 44, width: 30, height: 30))
        more.addTarget(self, action: #selector(morePressed), for: .touchUpInside)
        more.setImage(#imageLiteral(resourceName: "more"), for: .normal)
        navBar.addSubview(more)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    func backPressed() {
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func callPressed() {
        
        let digits = "9619925705"
        
        guard let number = URL(string: "tel://" + digits) else { return }
        UIApplication.shared.open(number)
    }
    
    func calendarPressed() {
        
        
    }
    
    func profilePressed() {
        
    }
    
    func morePressed() {

        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in

        }
        actionSheetController.addAction(cancelAction)
        
     
        let takePictureAction = UIAlertAction(title: "Call Support", style: .default) { action -> Void in
           
            
        }
        actionSheetController.addAction(takePictureAction)

        let choosePictureAction = UIAlertAction(title: "View Appointment Status", style: .default) { action -> Void in
            
            
        }
        actionSheetController.addAction(choosePictureAction)
        
        // We need to provide a popover sourceView when using it on iPad
//        actionSheetController.popoverPresentationController?.sourceView = sender as UIView

        self.present(actionSheetController, animated: true, completion: nil)
        
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
                                 messageDataForItemAt indexPath: IndexPath!) -> JSQMessageData! {
        return messages[indexPath.item]
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        return messages.count
    }
    
    fileprivate func setupBubbles() {
        let factory = JSQMessagesBubbleImageFactory()
        outgoingBubbleImageView = factory?.outgoingMessagesBubbleImage(
            with: self.HEX37A784())
        incomingBubbleImageView = factory?.incomingMessagesBubbleImage(
            with: UIColor.white)
    }

    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
                                 messageBubbleImageDataForItemAt indexPath: IndexPath!) -> JSQMessageBubbleImageDataSource! {
        let message = messages[indexPath.item]
        if message.senderId == senderId {
            
            return outgoingBubbleImageView
            
        } else {
            
            return incomingBubbleImageView
            
        }
    }
    
    override func collectionView(_ collectionView: JSQMessagesCollectionView!,
                                 avatarImageDataForItemAt indexPath: IndexPath!) -> JSQMessageAvatarImageDataSource! {
        
        let avatar = JSQMessagesAvatarImageFactory.avatarImage(with: #imageLiteral(resourceName: "demo.jpg"), diameter: 35)
        
        return avatar
        
    }
    
    override func collectionView(_ collectionView: UICollectionView,
                                 cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let message = messages[indexPath.row]
        
        let cell = super.collectionView(collectionView, cellForItemAt: indexPath)
            as! JSQMessagesCollectionViewCell
        
        if message.senderId != self.senderId {
            cell.textView!.textColor = UIColor.black
        }
        
        return cell
    }
    
    override func didPressSend(_ button: UIButton!, withMessageText text: String!, senderId: String!, senderDisplayName: String!, date: Date!) {
        
     
       let jsqmsg = JSQMessage(senderId: self.senderId, senderDisplayName: self.senderDisplayName, date: date as Date!, text: text)
        
        messages.append(jsqmsg!)
        
        self.finishSendingMessage(animated: true)
    }
    

}
