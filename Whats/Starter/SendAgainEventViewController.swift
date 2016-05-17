//
//  SendAgainEventViewController.swift
//  Whats
//
//  Created by Martreux Steven on 17/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import MapKit
import MessageUI
import EPContactsPicker

class SendAgainEventViewController: UIViewController {

    @IBOutlet var _btnEmot: UIButton!
    @IBOutlet var _mapView: MKMapView!
    var _event : EventData!
    let regionRadius: CLLocationDistance = 1000
    var _presentationApp : String = "What Application IOS"
    var _contacts : [String] = []
    var _date : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self._btnEmot.layer.cornerRadius = self._btnEmot.frame.width / 2
        self._btnEmot.layer.masksToBounds = true
        
        let initialLocation = CLLocation(latitude: self._event.latitude, longitude: self._event.longitude)
        self.centerMapOnLocation(initialLocation)
        
        self._btnEmot.titleLabel?.text = self._event.emoticone
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        self._mapView.setRegion(coordinateRegion, animated: true)
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(self._event.latitude, self._event.longitude)
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = self._event.action
        self._mapView.addAnnotation(objectAnnotation)
    }
    
    @IBAction func actionSendAgain(sender: AnyObject) {
        self.showDatePicker()
    }
    
    func showDatePicker() {
        
        DatePickerDialog().show(self._event.action!, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .DateAndTime, color : COLOR_MAIN) {
            (date) -> Void in
            self._date = date.toString("HH:mm MM-dd-yyyy")
            self.showContact()
        }
    }
    
    func showContact() {
        let contactPickerScene = EPContactsPicker(delegate: self, multiSelection:true, subtitleCellType: SubtitleCellValue.PhoneNumer, color : COLOR_MAIN)
        let navigationController = UINavigationController(rootViewController: contactPickerScene)
        self.presentViewController(navigationController, animated: true, completion: nil)
    }
}

extension SendAgainEventViewController : MFMessageComposeViewControllerDelegate {
    
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
            self.goMainView()
            
        default:
            break
        }
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func sendMessage() {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "\(self._event.emoticone)\n\(self._event.action)\nDate : \(self._date)\nWhere : \(self._event.adress)\n\(self._presentationApp)"
        messageVC.recipients = self._contacts
        messageVC.messageComposeDelegate = self;
        self.presentViewController(messageVC, animated: true, completion: nil)
    }
    
    func goMainView() {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
}

extension SendAgainEventViewController : EPPickerDelegate {
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
                self._contacts.append(contact.phoneNumbers[0].phoneNumber)
            }
        }
        if self._contacts.count > 0 {
            self.sendMessage()
        } else {
            let alert = UIAlertController(title: "Error", message: "You have to select at least one contact to send your event again", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
                alert.dismissViewControllerAnimated(true, completion: nil)
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}


