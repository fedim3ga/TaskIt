//
//  Date.swift
//  TaskIt
//
//  Created by Ben Blanchard on 19/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation

class Date {
    
    //Class function. This takes different integer values and converts them into an NSDate for our UIDatePicker. The # means that these show up when we call.
    class func from (#year:Int, month:Int, day: Int) -> NSDate {
       
        //Set up NSDateComponents, which sets up 'components' for year, month, day, hour, minute, second
        var components = NSDateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        //Set up calendar
        var gregorianCalendar = NSCalendar(identifier: NSGregorianCalendar)
        //Set up date variable in the 'calendar' with the components generated from the intergers.
        var date = gregorianCalendar?.dateFromComponents(components)
        
        return date!
    }
    
    // Class function, convert this date to a string with the format we want!
    class func toString (#date: NSDate) -> String {
        
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateStringFormatter.stringFromDate(date)
        
        return dateString
    }
    
    
    
    
}