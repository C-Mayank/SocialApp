//
//  FancyField.swift
//  Social App
//
//  Created by C Mayank Dogra on 28/10/17.
//  Copyright © 2017 C Mayank Dogra. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.borderWidth = 1.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 5)
    }

}
