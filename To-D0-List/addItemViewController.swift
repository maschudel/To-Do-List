//
//  addItemViewController.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/5/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import UIKit

class addItemViewController: UIViewController { //UIPickerViewDataSource, UIPickerViewDelegate {
    
    var selectedPriority: String = "Normal"
    var arrPriorityImg: [UIImage] = [
        UIImage(named: "1.png")!,
        UIImage(named: "2.png")! ]
    
    @IBOutlet weak var addItemTxt: UITextField!
    @IBOutlet weak var priorityImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTxt.becomeFirstResponder()
        priorityImg.image = arrPriorityImg[0]
    }
    
    @IBAction func priorityControl(sender: UISegmentedControl) {
        
        priorityImg.image = arrPriorityImg[sender.selectedSegmentIndex]
        
        if sender.selectedSegmentIndex == 0 {
            selectedPriority = "Normal"
        } else {
           selectedPriority = "High"
        }
    }
    
    @IBAction func addItemBtnPress(sender: UIButton) {
        
        if let text = addItemTxt.text where !text.isEmpty {
            
            let newObj = Todo(toDoItem: addItemTxt.text!, complete: false, priority: selectedPriority)
            arrToDo.append(newObj)
            addItemTxt.text = ""
            tabBarController?.selectedIndex = 0
        }
        
        Todo().saveUserDefaults()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}
