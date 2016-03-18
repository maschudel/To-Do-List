//
//  addItemViewController.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/5/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import UIKit

class addItemViewController: UIViewController ,UIPickerViewDataSource, UIPickerViewDelegate {
    
    var itemSelected: String = "Normal"
    var arrPriority = ["Normal", "Medium", "High"]
    var arrPriorityImg: [UIImage] = [
        UIImage(named: "1.png")!,
        UIImage(named: "2.png")!,
        UIImage(named: "3.png")! ]
    
    @IBOutlet weak var addItemTxt: UITextField!
    @IBOutlet weak var priorityPicker: UIPickerView!
    @IBOutlet weak var priorityImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addItemTxt.becomeFirstResponder()
        setPickerDefaults()

    }
    
    @IBAction func addItemBtnPress(sender: AnyObject) {
        
        if let text = addItemTxt.text where !text.isEmpty {
            
            let newObj = Todo(toDoItem: addItemTxt.text!, complete: false, priority: arrPriorityImg[priorityPicker.selectedRowInComponent(0)])
            arrToDo.append(newObj)
            addItemTxt.text = ""
            setPickerDefaults()
    
        }
        
        Todo().saveUserDefaults()
    
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
    
    func textFieldShouldRetrun(textField: UITextField!) ->Bool {
        
        addItemTxt.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        
        return 1
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return arrPriority.count
        
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrPriority[row]
        
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
        itemSelected = arrPriority[row]
        priorityImg.image = arrPriorityImg[row]
        
    }
    
    func setPickerDefaults() {
        
        priorityPicker.selectRow(0, inComponent: 0, animated: true)
        itemSelected = arrPriority[priorityPicker.selectedRowInComponent(0)]
        priorityImg.image = arrPriorityImg[0]
        
    }
}
