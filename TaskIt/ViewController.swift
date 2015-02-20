//
//  ViewController.swift
//  TaskIt
//
//  Created by Ben Blanchard on 16/02/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var taskArray:[TaskModel] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let date1 = Date.from(year: 2015, month: 02, day: 20)
        let date2 = Date.from(year: 2015, month: 02, day: 21)
        let date3 = Date.from(year: 2015, month: 02, day: 23)
        
        
        let task1 = TaskModel(task: "Study French", subtask: "Verbs", date: date1)
        let task2 = TaskModel(task: "Eat Dinner", subtask: "Sushi", date: date2)
        let task3 = TaskModel(task: "Gym", subtask: "5km", date: date3)
        
        taskArray += [task1,task2, task3]

        tableView.reloadData()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        
        func sortByDate(taskOne:TaskModel, taskTwo:TaskModel) -> Bool {
            return taskOne.date.timeIntervalSince1970 < taskTwo.date.timeIntervalSince1970
        }
        
        taskArray = taskArray.sorted(sortByDate)
        
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showTaskDetail" {
            let detailVC:TaskDetailViewController = segue.destinationViewController as TaskDetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let thisTask = taskArray[indexPath!.row]
            detailVC.detailTaskModel = thisTask
            detailVC.mainVC = self
        }
        else if segue.identifier == "showTaskAdd" {
            // Get access to AddTaskViewController
            let addTaskVC:AddTaskViewController = segue.destinationViewController as AddTaskViewController
            // Basically, addTaskVC constant here is mainVC from AddTaskViewController
            addTaskVC.mainVC = self
        }
        
        
        
        
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
            performSegueWithIdentifier("showTaskAdd", sender: self)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let thisTask = taskArray[indexPath.row]
        
        var cell:TaskCell = tableView.dequeueReusableCellWithIdentifier("myCell") as TaskCell
        
        cell.taskLabel.text = thisTask.task
        cell.descriptionLabel.text = thisTask.subtask
        cell.dateLabel.text = Date.toString(date: thisTask.date)
        
        return cell
    }
    
    
    //UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        println(indexPath.row)
        
        performSegueWithIdentifier("showTaskDetail", sender: self)
        
        }
    
    
    //Helpers
    
    

    

}

