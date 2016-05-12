//
//  ExtensionDate.swift
//  eLearning
//
//  Created by Martreux Steven on 25/02/2016.
//  Copyright © 2016 Martreux Steven. All rights reserved.
//

import Foundation

extension NSDate {
    /// Convert a string to date using format
    ///
    /// - parameters:
    ///     - String: The string date (eg. 2015-01-01 10:00:00)
    ///     - String: The string date format (eg. yyyy-MM-dd HH:mm:ss)
    /// - returns:
    ///     A NSDate object which corresponds to the string date or nil
    class func dateFromString(stringDate: String, format: String) -> NSDate! {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.dateFromString(stringDate)
    }
    
    /// Check if a date is anterior to another
    ///
    /// - parameters:
    ///     - NSDate: The date to compare with
    /// - returns:
    ///     `true` if the instance date is anterior to the provided one, `false` otherwise
    func isAnteriorToDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedAscending
    }
    
    /// Check if a date is posterior to another
    ///
    /// - parameters:
    ///     - NSDate: The date to compare with
    /// - returns:
    ///     `true` if the instance date is posterior to the provided one, `false` otherwise
    func isPosteriorToDate(date: NSDate) -> Bool {
        return self.compare(date) == NSComparisonResult.OrderedDescending
    }
    
    /// Convert a date to string using format
    ///
    /// - parameters:
    ///     - NSDate: The date to convert
    ///     - String: The string date format (eg. yyyy-MM-dd HH:mm:ss)
    /// - returns:
    ///     A String which represents the provided date
    class func stringFromDate(date: NSDate, format: String) -> String {
        let dateFormat = NSDateFormatter()
        dateFormat.dateFormat = format
        return dateFormat.stringFromDate(date)
    }
    
    /// Convert date to string using format
    ///
    /// - parameters:
    ///     - String: The string date format (eg. yyyy-MM-dd HH:mm:ss)
    /// - returns:
    ///     A String which represents the instance date
    func toString(format: String) -> String {
        return NSDate.stringFromDate(self, format: format)
    }
    
    private func getDateComponents() -> NSDateComponents {
        let calendar: NSCalendar! = NSCalendar.currentCalendar()
        calendar.timeZone = NSTimeZone(abbreviation: "UTC")!
        let dateComponents: NSDateComponents = calendar.components([NSCalendarUnit.Day, NSCalendarUnit.Weekday, NSCalendarUnit.Month, NSCalendarUnit.Year, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: self)
        return dateComponents
    }
    
    var second: Int { get { return self.getDateComponents().second } }
    var minute: Int { get { return self.getDateComponents().minute } }
    var hour: Int { get { return self.getDateComponents().hour } }
    var day: Int { get { return self.getDateComponents().day } }
    var weekDay: Int { get { return self.getDateComponents().weekday - 1 } }
    var month: Int { get { return self.getDateComponents().month } }
    var year: Int { get { return self.getDateComponents().year } }
}