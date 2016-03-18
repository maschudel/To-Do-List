//
//  ToDoCell.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/4/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    var priorityImg:UIImage?
    
    @IBOutlet weak var doneSw: UISwitch!
    @IBOutlet weak var priImg: UIImageView!
    @IBOutlet weak var itemTxt: UILabel!
    @IBOutlet weak var timeTxt: UILabel!
    
    
    @IBAction func statusChanged(sender: UISwitch){
       
        if arrToDo[doneSw.tag].complete == true {
           
            arrToDo[doneSw.tag].complete = false
            
        } else {
        
            arrToDo[doneSw.tag].complete = true
            
        }
        
        Todo().saveUserDefaults()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(item: String, complete: Bool, priority: UIImage, timestamp: NSDate) {
        
        let now = NSDate()
        let elapsedTime = now.timeIntervalSinceDate(timestamp)
        let hours = elapsedTime / 3600.0
        let minutes = elapsedTime % 3600.0 / 60.0
        let seconds = elapsedTime % 60.0
    
        itemTxt.text = item
        priImg.image = priority
        doneSw.setOn(complete, animated: true)
        
        if hours > 48.0 {
            
            let days = Int(hours) / 24
            timeTxt.text = String("Entered \(days) day ago")
            
            } else if (Int(hours) > 0){
            
                timeTxt.text = String("Entered \(Int(hours)) hours ago")
            
            } else if (Int(minutes) > 0 ) {
            
                timeTxt.text = String("Entered \(Int(minutes)) minutes ago")
            
        } else {
            
            timeTxt.text = String("Entered \(Int(seconds)) seconds ago")
        }
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
