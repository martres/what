//
//  EditEventViewController.swift
//  Whats
//
//  Created by Martreux Steven on 10/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class EditEventViewController: UIViewController {
    
    @IBOutlet var _viewback: UIView!
    var _event : Event! = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(self._event._emoji)  \(self._event._action)"
        self.setColorNavBar(self._event._color)
        self._viewback.backgroundColor = self._event._color
        self._viewback.alpha = 0.1
    }
    
    func setColorNavBar(color : UIColor) {
        self.navigationController?.navigationBar.barTintColor = color
    }
}
