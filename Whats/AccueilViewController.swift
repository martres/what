//
//  AccueilViewController.swift
//  Whats
//
//  Created by Martreux Steven on 09/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class AccueilViewController: UIViewController {

    @IBOutlet var firstSectionBtn: UIButton!
    @IBOutlet var secondSectionBtn: UIButton!
    @IBOutlet var thirdSectionBtn: UIButton!
    @IBOutlet var fourSectionBtn: UIButton!
    @IBOutlet var fiveSectionBtn: UIButton!
    @IBOutlet var sixSectionBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.firstSectionBtn.centImageAndTitle()
        self.secondSectionBtn.centImageAndTitle()
        self.thirdSectionBtn.centImageAndTitle()
        self.fourSectionBtn.centImageAndTitle()
        self.fiveSectionBtn.centImageAndTitle()
        self.sixSectionBtn.centImageAndTitle()  
    }
}
