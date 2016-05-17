//
//  EventData.swift
//  Whats
//
//  Created by Martreux Steven on 16/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import Foundation
import CoreData
import CoreDataHelper

@objc(EventData)
class EventData: NSManagedObject, CDHelperEntity {
    
    static var entityName: String! { return "EventData" }
    
}
