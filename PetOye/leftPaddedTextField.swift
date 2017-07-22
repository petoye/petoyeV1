//
//  leftPaddedTextField.swift
//  PetOye
//
//  Created by Ameya Vichare on 20/07/17.
//  Copyright © 2017 vit. All rights reserved.
//

import UIKit

class leftPaddedTextField: UITextField {

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.width - 40, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 20, y: bounds.origin.y, width: bounds.width - 40, height: bounds.height)
    }
    
    override func clearButtonRect(forBounds bounds: CGRect) -> CGRect {
        
        return CGRect(x: bounds.size.width/2-20, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
    }

}
