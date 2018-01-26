//
//  SettingsVC.swift
//  Social App
//
//  Created by C Mayank Dogra on 14/01/18.
//  Copyright © 2018 C Mayank Dogra. All rights reserved.
//

import UIKit
import Firebase

class SettingsVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLbl: FancyField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: segueToFeeds, sender: nil)
    }
    
    
}
