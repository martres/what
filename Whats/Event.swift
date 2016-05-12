//
//  Event.swift
//  Whats
//
//  Created by Martreux Steven on 10/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import Foundation
import CoreData
import MapKit

class Event {
    
    let _action : String!
    let _emoji : String!
    let _date : NSDate!
    let _color : UIColor!
    var _adress : String! = ""
    var _location : CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(action : String, emoji : String, date : NSDate = NSDate(), color : UIColor)
    {
        self._action = action
        self._emoji = emoji
        self._date = date
        self._color = color
    }
    
}
