//
//  LoginFBViewController.swift
//  Whats
//
//  Created by Martreux Steven on 09/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class LoginFBViewController: UIViewController{
    
    @IBOutlet var fbLoginView : FBSDKLoginButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }
}

extension LoginFBViewController : FBSDKLoginButtonDelegate{
    
    func loginViewShowingLoggedInUser(loginView : FBSDKLoginButton!) {
        print("User Logged In")
    }
    
    /* Facebook */
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((FBSDKAccessToken.currentAccessToken()) != nil){
            self.showAccueil()
        }
    }
    
    func showAccueil()
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("AccueilViewController") as! AccueilViewController
        self.navigationController?.setViewControllers([viewController], animated: true)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
    }
}
