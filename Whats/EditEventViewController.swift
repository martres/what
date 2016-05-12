//
//  EditEventViewController.swift
//  Whats
//
//  Created by Martreux Steven on 10/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit
import MapKit

class EditEventViewController: UIViewController {
    
    @IBOutlet var _searchView: UIView!
    @IBOutlet var _mapView: MKMapView!
    @IBOutlet var _validateBtn: UIButton!
    var _event : Event! = nil
    let _locationManager = CLLocationManager()
    var _resultSearchController: UISearchController? = nil
    var _selectedPin:MKPlacemark? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\(self._event._emoji)  \(self._event._action)"
        self.setColorNavBar(self._event._color)
        self._validateBtn.setCornerBorder(2, borderColor: UIColor.whiteColor(), cornerRadius: 8)
        self._validateBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self._validateBtn.backgroundColor = self._event._color
        self.initLocation()
        self.setSearchBar()
    }
    
    func setSearchBar()
    {
        let locationSearchTable = storyboard!.instantiateViewControllerWithIdentifier("LocationSearchTable") as! LocationSearchTable
        locationSearchTable.mapView = _mapView
        locationSearchTable.handleMapSearchDelegate = self
        self._resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        self._resultSearchController?.searchResultsUpdater = locationSearchTable
        
        
        let searchBar = self._resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for places"
        self._searchView.addSubview(searchBar)
        
        self._resultSearchController?.hidesNavigationBarDuringPresentation = false
        self._resultSearchController?.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true

    }
    
    func initLocation()
    {
        self._locationManager.delegate = self
        self._locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self._locationManager.requestWhenInUseAuthorization()
        self._mapView.showsUserLocation = true
        self._locationManager.startUpdatingLocation()
    }
    
    func setColorNavBar(color : UIColor) {
        self.navigationController?.navigationBar.barTintColor = color
    }
    
    func displayLocationInfo(placemark: CLPlacemark?)
    {
        if let containsPlacemark = placemark
        {
            //stop updating location to save battery life
            self._locationManager.stopUpdatingLocation()
            
            let street = (containsPlacemark.name != nil) ? containsPlacemark.name : ""
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            
            self._event._adress = "\(street!) \(locality!) \(postalCode!) \n\(administrativeArea!) \(country!)"
            self.showDatePicker()
            print(self._event._adress!)
        }
        
    }
    
    func getMyLocation() {
        let geoCoder = CLGeocoder()
        let location = self._locationManager.location
        geoCoder.reverseGeocodeLocation(location!, completionHandler: { (placemarks, error) -> Void in
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            self.displayLocationInfo(placeMark)
        })
    }
    
    func showDatePicker() {
        
        DatePickerDialog().show(self._event._adress, doneButtonTitle: "Done", cancelButtonTitle: "Cancel", datePickerMode: .DateAndTime, color : self._event._color) {
            (date) -> Void in
            self._locationManager.stopUpdatingLocation()
        }
    }
    
    @IBAction func validateAction(sender: UIButton) {
        if self._event._adress.isEmpty {
            self.getMyLocation()
        } else {
            self.showDatePicker()
        }
    }
}

extension EditEventViewController : CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            self._locationManager.requestLocation()
        }
    }
        func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location.coordinate, span: span)
            self._mapView.setRegion(region, animated: true)
        }
    }
    

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("error:: \(error)")
    }
}

extension EditEventViewController: HandleMapSearch {
    func dropPinZoomIn(placemark:MKPlacemark){
        // cache the pin
        self._locationManager.stopUpdatingLocation()
        self._selectedPin = placemark
        self.displayLocationInfo(placemark)
        // clear existing pins
        self._mapView!.removeAnnotations(self._mapView!    .annotations)
        let annotation = MKPointAnnotation()
        annotation.coordinate = placemark.coordinate
        annotation.title = placemark.name
        if let city = placemark.locality,
            let state = placemark.administrativeArea {
            annotation.subtitle = "\(city) \(state)"
        }
        self._mapView!.addAnnotation(annotation)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegionMake(placemark.coordinate, span)
        self._mapView!.setRegion(region, animated: true)
    }
}
