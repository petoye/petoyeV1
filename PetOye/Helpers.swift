//
//  Helpers.swift
//  PetOye
//
//  Created by Ameya Vichare on 19/06/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func giveToastPoint() -> CGPoint {
        
        return CGPoint(x: self.view.frame.midX, y: self.view.frame.size.height - 150)
    }
    
    func box(text: String, fontSize: CGFloat, fontName: String) -> (CGFloat,CGFloat) {
        
        let someString = text
        let yourFont = UIFont(name: fontName, size: fontSize)
        let stringBoundingBox = someString.size(attributes: [NSFontAttributeName : yourFont])
        
        return (stringBoundingBox.width,stringBoundingBox.height)
    }
}
