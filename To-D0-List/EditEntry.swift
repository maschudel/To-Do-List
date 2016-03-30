//
//  EditEntry.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/27/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import UIKit

class EditEntry: UIViewController {

    @IBOutlet weak var editTxt: UITextField!
    @IBOutlet weak var priorityImg: UIImageView!
    @IBOutlet weak var selectPriority: UISegmentedControl!
    
    var prioritySelected: String = ""
    var index:Int!
    var saveItem: String!
    var saveIndex: Int!
    var savePriority: String!
    var editArray:[Todo] = []

    @IBAction func pressedSelecton(sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            prioritySelected = "Normal"
            priorityImg.image = UIImage(named: "1.png)")
        } else {
            prioritySelected = "High"
            priorityImg.image = UIImage(named: "2.png)")
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "save" {
            
            saveIndex = index
            saveItem = editTxt.text!
            savePriority = prioritySelected
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
        
        self.navigationController?.navigationBar.topItem?.title = "Edit ToDo Entry"
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light" , size: 17)!]
        editTxt.text = editArray[index!].toDoItem
        
        if editArray[index!].itemPriority == "Normal" {
         
        priorityImg.image = UIImage(named: "1.png")
        selectPriority.selectedSegmentIndex = 0
        prioritySelected = "Normal"
            
        } else {
            
            priorityImg.image = UIImage(named: "2.png")
            selectPriority.selectedSegmentIndex = 1
            prioritySelected = "High"
        }
    }
}
