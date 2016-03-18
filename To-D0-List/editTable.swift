//
//  editTable.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/11/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import UIKit

class editTable: UITableViewController {
    
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var editTxt: UITextField!
    @IBOutlet weak var currentPriority: UIImageView!
    @IBOutlet weak var pickPriority: UIImageView!
    
    var index:Int?
    var saveItem: String?
    var saveIndex: Int?
    var editArray:[Todo] = []
    
    
    @IBAction func returntToDoTable(sender: AnyObject) {
        
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "save" {
            
            saveItem = editTxt.text
            saveIndex = index
            
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldRetrun(textField: UITextField!) ->Bool {
        
        editTxt.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        
        editTxt.text = editArray[index!].toDoItem
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            editTxt.becomeFirstResponder()
            
        }
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }

}
