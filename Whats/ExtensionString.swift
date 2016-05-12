//
//  ExtensionString.swift
//  Whats
//
//  Created by Martreux Steven on 11/05/2016.
//  Copyright © 2016 me. All rights reserved.
//

import Foundation

public extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(self)
    }
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    var Empty : String {
        if self.isEmpty {
            return ""
        }
        return self
    }
}
