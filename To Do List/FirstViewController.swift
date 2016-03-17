//
//  FirstViewController.swift
//  To Do List
//
//  Created by Guneet on 2016-03-17.
//  Copyright © 2016 Guneet. All rights reserved.
//

import UIKit

var toDoList = [String]()//global var,it would be available to both views

class FirstViewController: UIViewController, UITableViewDelegate {
    
    
    
    
    @IBOutlet var toDoListTabel: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList") != nil {
        
        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList") as! [String]
        
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return toDoList.count
        
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
       cell.textLabel?.text = toDoList[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) { //to del an item by swipping to the left
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList") //this will update the version of array
            
            toDoListTabel.reloadData()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        toDoListTabel.reloadData()
    }
    
}

