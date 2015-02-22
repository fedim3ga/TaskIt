//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Ben Blanchard on 18/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    //Outlets for elements
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //A TaskModel instance
    var detailTaskModel: TaskModel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Set the details to the cell details!
        taskTextField.text = detailTaskModel.task
        subTaskTextField.text = detailTaskModel.subtask
        datePicker.date = detailTaskModel.date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func doneButtonPressed(sender: UIBarButtonItem) {
        //Access the app delegate. Update the detailTaskModel with the changes. Save thos changes to the AppDelegate. Then pop the view controller.
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        detailTaskModel.task = taskTextField.text
        detailTaskModel.subtask = subTaskTextField.text
        detailTaskModel.date = datePicker.date
        detailTaskModel.completed = detailTaskModel.completed
        appDelegate.saveContext()
        
        self.navigationController?.popViewControllerAnimated(true)
    }

}
