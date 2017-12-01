//
//  ViewController.swift
//  Social App
//
//  Created by C Mayank Dogra on 28/10/17.
//  Copyright © 2017 C Mayank Dogra. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    @IBOutlet weak var emailText: FancyField!
    @IBOutlet weak var passwordText: FancyField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: segueFeed, sender: nil)
        }
    }


    @IBAction func facebookBtnTapped(_ sender: AnyObject) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("MD: Unable to authenticate with facebook")
            } else if result?.isCancelled == true {
                print("MD: User cancelled the facebook authentication")
            } else {
                print("MD: Successfully authenticated with facebook")
                let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
        }
        
    }
    
    func firebaseAuth(_ credentail: AuthCredential) {
        Auth.auth().signIn(with: credentail) { (user, error) in
            if error != nil {
                print("MD: Unable to authenticate with firebase: \(error)")
            } else {
                print("MD: Successfully authenticated with firebase")
                if let user = user {
                    let userData = ["provider": credentail.provider]
                    self.completeSignIn(id: user.uid, userData: userData)
                }
            }
        }
    }
    
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("MD:Data saved to Keychain -- \(keychainResult)")
        performSegue(withIdentifier: segueFeed, sender: nil)
    }
    
    
    @IBAction func signInTapped(_ sender: AnyObject) {
        
        if let email = emailText.text, let pswd = passwordText.text {
            Auth.auth().signIn(withEmail: email, password: pswd, completion: { (user, error) in
                if error == nil {
                    print("MD: Email User authenticated with firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    Auth.auth().createUser(withEmail: email, password: pswd, completion: { (user, error) in
                        if error != nil {
                            print("MD: Unable to authenticate with firebase using email")
                        } else {
                            print("MD: Successfully authenticated with firebase")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
        
    }
    
}

