//
//  TaskModel.swift
//  TaskIt
//
//  Created by Ben Blanchard on 21/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation
//Import the CoreData framework
import CoreData

//Allows ObjC code to be written
@objc (TaskModel)
//CoreData model
class TaskModel: NSManagedObject {
    //These are our Attributes (like 'properties'). We defined these in the TaskItModel.xcdatamodeld
    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
