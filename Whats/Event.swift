//
//  Event.swift
//  Whats
//
//  Created by Martreux Steven on 10/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import Foundation
import CoreData

class Event {
    
    let _theme : String!
    let _action : String!
    let _emoji : String!
    let _date : NSDate!
    
    init(theme : String, action : String, emoji : String, date : NSDate)
    {
        self._action = action
        self._theme = theme
        self._emoji = emoji
        self._date = date
    }
    
}
