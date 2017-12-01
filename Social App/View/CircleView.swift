//
//  CircleView.swift
//  Social App
//
//  Created by C Mayank Dogra on 31/10/17.
//  Copyright © 2017 C Mayank Dogra. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }
    
    
    /*
    func layoutSubViews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
    */
}
