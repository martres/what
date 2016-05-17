//
//  ListContactViewController.swift
//  Whats
//
//  Created by Martreux Steven on 11/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import EPContactsPicker
import MessageUI

class ListContactViewController: UIViewController {

    @IBOutlet var _addFriendsBtn: UIButton!
    @IBOutlet var _NumberContactLbl: UILabel!
    @IBOutlet var _sendBtn: UIButton!
    var _event : Event! = nil
    var _contacts : [String] = []
    var _presentationApp : String = "What Application IOS"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Select friends"
        
        self._NumberContactLbl.text = "None friends are selected 🤔"
        self._NumberContactLbl.textColor = self._event._color
        
        self._addFriendsBtn.layer.cornerRadius = self._addFriendsBtn.frame.width / 2
        self._addFriendsBtn.layer.masksToBounds = true
        self._addFriendsBtn.backgroundColor = self._event._color
        
        self._sendBtn.backgroundColor = self._event._color
        self._sendBtn.hidden = true
    }
    
    @IBAction func addFriendsAction(sender: UIButton) {
        let contactPickerScene = EPContactsPicker(delegate: self, multiSelection:true, subtitleCellType: SubtitleCellValue.PhoneNumer, color : self._event._color)
        let navigationController = UINavigationController(rootViewController: contactPickerScene)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func _sendAction(sender: UIButton) {
        self.sendMessage()
    }
}

extension ListContactViewController : MFMessageComposeViewControllerDelegate {
    
    func messageComposeViewController(controller: MFMessageComposeViewController, didFinishWithResult result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResultCancelled.rawValue :
            print("message canceled")
            
        case MessageComposeResultFailed.rawValue :
            let alert = UIAlertController(title: "Error", message: "Cannot send message", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
            
        case MessageComposeResultSent.rawValue :
            self.saveEvent()
            self.goMainView()
            
        default:
            break
        }
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sendMessage() {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "\(self._event._emoji)\n\(self._event._action)\nDate : \(self._event._date)\nWhere : \(self._event._adress)\n\(self._presentationApp)"
        messageVC.recipients = self._contacts
        messageVC.messageComposeDelegate = self;
        self.presentViewController(messageVC, animated: true, completion: nil)
    }
    
    func saveEvent() {
        let eventSave : EventData = EventData.new()
        eventSave.adress = self._event._adress
        eventSave.date = self._event._date
        eventSave.emoticone = self._event._emoji
        eventSave.action = self._event._action
        eventSave.longitude = self._event._location.coordinate.longitude
        eventSave.latitude = self._event._location.coordinate.latitude
        eventSave.save()
    }
    
    func goMainView() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

extension ListContactViewController : EPPickerDelegate {
    func epContactPicker(_: EPContactsPicker, didContactFetchFailed error : NSError)
    {
        print("Failed with error \(error.description)")
    }
    
    func epContactPicker(_: EPContactsPicker, didCancel error : NSError)
    {
        print("User canceled the selection");
    }
    
    func epContactPicker(_: EPContactsPicker, didSelectMultipleContacts contacts: [EPContact]) {
        print("The following contacts are selected")
        for contact in contacts {
            if contact.phoneNumbers.count > 0 {
                print("Contact Selected : \(contact.phoneNumbers[0].phoneNumber)")
                _contacts.append(contact.phoneNumbers[0].phoneNumber)
            }
        }
        self._sendBtn.hidden = false
        if self._contacts.count == 1 {
            self._NumberContactLbl.text = "\(self._contacts.count) friend is selected 😄"
        } else {
            self._NumberContactLbl.text = "\(self._contacts.count) friends are selected 😄"
        }
    }
}

