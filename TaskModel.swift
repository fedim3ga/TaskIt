//
//  TaskModel.swift
//  TaskIt
//
//  Created by Ben Blanchard on 21/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import Foundation
import CoreData

@objc (TaskModel)
class TaskModel: NSManagedObject {

    @NSManaged var completed: NSNumber
    @NSManaged var date: NSDate
    @NSManaged var subtask: String
    @NSManaged var task: String

}
