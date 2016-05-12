//
//  ExtensionUIViewController.swift
//  eLearning
//
//  Created by Martreux Steven on 25/11/2015.
//  Copyright © 2015 Martreux Steven. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    static func initFromStoryBoard(identifier : String) -> UIViewController? {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        let vc = mainStoryboard.instantiateViewControllerWithIdentifier(identifier)
        return vc
    }
}