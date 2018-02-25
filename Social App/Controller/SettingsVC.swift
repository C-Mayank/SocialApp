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
    
    var imagePicker: UIImagePickerController!
    var imageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
        performSegue(withIdentifier: segueToFeeds, sender: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImg.image = image
            imageSelected = true
        } else {
            print("MD: A valid image wasn't selected!!!")
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func imgEdit(_ sender: Any) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    
}
