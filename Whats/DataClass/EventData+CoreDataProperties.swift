//
//  EventData+CoreDataProperties.swift
//  Whats
//
//  Created by Martreux Steven on 16/05/2016.
//  Copyright © 2016 me. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EventData {

    @NSManaged var action: String?
    @NSManaged var adress: String?
    @NSManaged var date: String?
    @NSManaged var emoticone: String?
    @NSManaged var longitude: Double
    @NSManaged var latitude: Double

}
