//
//  TaskDetailViewController.swift
//  TaskIt
//
//  Created by Ben Blanchard on 18/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var subTaskTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    var detailTaskModel: TaskModel!
    var mainVC:ViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
        
        var task = TaskModel(task: taskTextField.text, subtask: subTaskTextField.text, date: datePicker.date)
        mainVC.taskArray[mainVC.tableView.indexPathForSelectedRow()!.row] = task
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    
    
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
