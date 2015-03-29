//
//  SettingsViewController.swift
//  TaskIt
//
//  Created by Ben Blanchard on 29/03/2015.
//  Copyright (c) 2015 Ben Blanchard. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {


    @IBOutlet weak var completeNewTodoTableView: UITableView!
    @IBOutlet weak var capitaliseTableView: UITableView!
    @IBOutlet weak var versionLabel: UILabel!
    
    
    let kVersionNumber = "1.0"
    let kShouldCapitaliseTaskKey = "shouldCapitaliseTask"
    let kShouldCompleteNewTodoKey = "completeNewTodo"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.capitaliseTableView.delegate = self
        self.capitaliseTableView.dataSource = self
        self.capitaliseTableView.scrollEnabled = false
        
        self.completeNewTodoTableView.delegate = self
        self.completeNewTodoTableView.dataSource = self
        self.completeNewTodoTableView.scrollEnabled = false
        
        self.title = "Settings"
        self.versionLabel.text = kVersionNumber
        
        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("doneBarButtonItemPressed:"))
        self.navigationItem.leftBarButtonItem = doneButton
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func doneBarButtonItemPressed(barButtonItem: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if tableView == self.capitaliseTableView {
            var capitaliseCell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("capitaliseCell") as UITableViewCell
            
            if indexPath.row == 0 {
                capitaliseCell.textLabel.text = "No do not capitalise"
                
                if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCapitaliseTaskKey) == false {
                    capitaliseCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                } else {
                    capitaliseCell.accessoryType = UITableViewCellAccessoryType.None
                }
                
            }
            else {
                
                capitaliseCell.textLabel.text == "Yes, capitalise!"
                
                if NSUserDefaults.standardUserDefaults().boolForKey(kShouldCapitaliseTaskKey) == true {
                    capitaliseCell.accessoryType = UITableViewCellAccessoryType.Checkmark
                } else {
                    capitaliseCell.accessoryType = UITableViewCellAccessoryType.None
                }
            }
            return capitaliseCell
        }
    }
    
    
}

