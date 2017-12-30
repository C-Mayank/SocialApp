//
//  RoundedImage.swift
//  Social App
//
//  Created by C Mayank Dogra on 30/12/17.
//  Copyright © 2017 C Mayank Dogra. All rights reserved.
//

import UIKit

class RoundedImage: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = 5.0
    }
    
}
