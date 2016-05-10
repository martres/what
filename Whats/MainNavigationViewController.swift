//
//  MainNavigationViewController.swift
//  
//
//  Created by Martreux Steven on 09/05/2016.
//
//

import UIKit

class MainNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if ((FBSDKAccessToken.currentAccessToken()) != nil)
        {
            print("Connexion Facebook : Connecté")
            self.showAccueil()
        }
        else
        {
            print("Connexion Facebook : Non Connecté")
            self.showViewConnexionFacebook()
        }
        UIApplication.sharedApplication().statusBarStyle = .LightContent
    }
    
    func showViewConnexionFacebook() {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("LoginFBViewController") as! LoginFBViewController
        self.pushViewController(viewController, animated: true)
    }
    
    func showAccueil()
    {
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewControllerWithIdentifier("AccueilViewController") as! AccueilViewController
        self.pushViewController(viewController, animated: true)
    }

}
