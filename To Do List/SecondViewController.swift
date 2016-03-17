//
//  SecondViewController.swift
//  To Do List
//
//  Created by Guneet on 2016-03-17.
//  Copyright © 2016 Guneet. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    
    
    @IBOutlet var item: UITextField!
    
    
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(item.text!)
        item.text = ""
        
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList") //this will update the array and the NSUserdefault with the same array on permanent storage and temporary storage.
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFielShouldReturn(textField: UITextField!) -> Bool {
        
        item.resignFirstResponder()
        return true
        
    }
    
}

