//
//  AddTaskViewController.swift
//  TaskIt
//
//  Created by Ben Blanchard on 19/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {


    // Outlets for our UI elements
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subtaskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonTapped(sender: UIButton) {
        //When the cancel button is pressed, dismiss the view controller. (i.e, go back to the previous VC)
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func addTaskButtonTapped(sender: UIButton) {
        
        //Access our AppDelegate by creating an instance of the AppDelegate
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        //A managedObjectContext basically managages the managedObjects. Imagine it as a kind of GitHub for objects. Sort of. NEED A BETTER EXPLANATION.
        let managedObjectContext = appDelegate.managedObjectContext
        //A description for our entity. Our entity is a TaskModel. It is managed by the managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("TaskModel", inManagedObjectContext: managedObjectContext!)
        
        //Create a task that is a TaskModel instance.
        let task = TaskModel(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        
        //Set attributes from the UI Elements
        task.task = taskTextField.text
        task.subtask = taskTextField.text
        task.date = datePicker.date
        task.completed = false
        
        // SAVE. Calling the saveContext() function essentially saves the task.
        appDelegate.saveContext()
        
        //request all entities named "TaskModel"
        var request = NSFetchRequest(entityName: "TaskModel")
        var error:NSError? = nil
        //Populate an array with the TaskModels that have been requested
        var results:NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        for res in results {
            println(res)
        }
        
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
