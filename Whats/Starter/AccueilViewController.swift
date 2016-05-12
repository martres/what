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
    
    var _firstDescription : [String] = []
    var _firstEmoji : [String]  = []
    var _secondDescription : [String] = []
    var _secondEmoji : [String]  = []
    var _thirdDescription : [String]  = []
    var _thirdEmoji : [String] = []
    var _fourDescription : [String] = []
    var _fourEmoji : [String] = []
    var _fiveDescription : [String] = []
    var _fiveEmoji : [String] = []
    var _sixDescription : [String] = []
    var _sixEmoji : [String] = []
    var _ThemeSelected : Theme! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = false
        self.centerImageAllBtn()
        self.createData()
    }
    
    func createData()
    {
        /*Funny Theme */
        self._firstDescription.append("Wanna a beer ?")
        self._firstEmoji.append("🍻")
        self._firstDescription.append("Go to the cinema ?")
        self._firstEmoji.append("🎥")
        self._firstDescription.append("Make a party ?")
        self._firstEmoji.append("🍾")
        
        /* Sport Theme */
        self._secondDescription.append("Wanna play basketball ?")
        self._secondEmoji.append("🏀")
        self._secondDescription.append("Wanna play football ?")
        self._secondEmoji.append("⚽️")
        self._secondDescription.append("Wanna play baseball ?")
        self._secondEmoji.append("⚾️")
        self._secondDescription.append("Wanna play tennis ?")
        self._secondEmoji.append("🎾")
        
        /* Food Theme */
        self._thirdDescription.append("Wanna eat fastfood ?")
        self._thirdEmoji.append("🍔")
        self._thirdDescription.append("Wanna eat pizza ?")
        self._thirdEmoji.append("🍕")
        self._thirdDescription.append("Wanna eat icecream ?")
        self._thirdEmoji.append("🍦")
        self._thirdDescription.append("Wanna a coffee ?")
        self._thirdEmoji.append("☕️")
        
        /*Love Theme */
        self._fourDescription.append("Can I kiss you ?")
        self._fourEmoji.append("👄")
        self._fourDescription.append("Do you want to go the restaurant with me ?")
        self._fourEmoji.append("🍽")
        self._fourDescription.append("Do you want to sleep at my place ?")
        self._fourEmoji.append("🙈")
        self._fourDescription.append("I have a gift for you, come !")
        self._fourEmoji.append("🎁")
        
        /*Shopping Theme */
        self._fiveDescription.append("I need new shoes !!")
        self._fiveEmoji.append("👠")
        self._fiveDescription.append("Wanna go shoopping ?")
        self._fiveEmoji.append("👚")
        self._fiveDescription.append("I need a new swimsuit !!")
        self._fiveEmoji.append("👙")
        self._fiveDescription.append("I need a new dress !!")
        self._fiveEmoji.append("👗")
        
        /*Working Theme */
        self._sixDescription.append("I need to see you at my office")
        self._sixEmoji.append("🗄")
        self._sixDescription.append("I need to work with you !")
        self._sixEmoji.append("🖥")
        self._sixDescription.append("Do we work at this date ?")
        self._sixEmoji.append("📅")
    }
    
    func centerImageAllBtn()
    {
        self.firstSectionBtn.centImageAndTitle()
        self.secondSectionBtn.centImageAndTitle()
        self.thirdSectionBtn.centImageAndTitle()
        self.fourSectionBtn.centImageAndTitle()
        self.fiveSectionBtn.centImageAndTitle()
        self.sixSectionBtn.centImageAndTitle()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = COLOR_MAIN
    }
    
    
    @IBAction func ThemeFunnyAction(sender: UIButton) {
        self._ThemeSelected = nil
        self._ThemeSelected = Theme(color: COLOR_FUNNY, emoji: self._firstEmoji, description: self._firstDescription, pictureName: "beer")
        self.performSegueWithIdentifier("PushToAction", sender: self)
    }
    
    @IBAction func ThemeSportAction(sender: UIButton) {
        self._ThemeSelected = nil
        self._ThemeSelected = Theme(color: COLOR_SPORT, emoji: self._secondEmoji, description: self._secondDescription, pictureName: "basketball")
        self.performSegueWithIdentifier("PushToAction", sender: self)
    }
    
    @IBAction func ThemeFoodAction(sender: UIButton) {
        self._ThemeSelected = nil
        self._ThemeSelected = Theme(color: COLOR_FOOD, emoji: self._thirdEmoji, description: self._thirdDescription, pictureName: "burger")
        self.performSegueWithIdentifier("PushToAction", sender: self)
    }
    
    @IBAction func ThemeLoveAction(sender: UIButton) {
        self._ThemeSelected = nil
        self._ThemeSelected = Theme(color: COLOR_LOVE, emoji: self._fourEmoji, description: self._fourDescription, pictureName: "heart")
        self.performSegueWithIdentifier("PushToAction", sender: self)
        
    }
    
    @IBAction func ThemeShoppingAction(sender: UIButton) {
        self._ThemeSelected = nil
        self._ThemeSelected = Theme(color: COLOR_SHOPPING, emoji: self._fiveEmoji, description: self._fiveDescription, pictureName: "shopping")
        self.performSegueWithIdentifier("PushToAction", sender: self)
    }
    
    @IBAction func ThemeWorkingAction(sender: UIButton) {
        self._ThemeSelected = nil
        self._ThemeSelected = Theme(color: COLOR_WORKING, emoji: self._sixEmoji, description: self._sixDescription, pictureName: "working")
        self.performSegueWithIdentifier("PushToAction", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PushToAction" {
            let vc : GiveActionViewController = segue.destinationViewController as! GiveActionViewController
            vc._theme = self._ThemeSelected
        }
    }
    
    
    
    
    
}
