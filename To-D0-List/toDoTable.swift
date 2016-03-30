//
//  toDoTable.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/5/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//


import UIKit

var arrToDo = [Todo]()

class toDoTable: UITableViewController {
    
    @IBOutlet var toDoTable: UITableView!
    var saveIndex: Int?
    var saveItem: String?
    
    @IBAction func saveEditItem (segue: UIStoryboardSegue) {
        
        print("in segue")
        let saveTableView = segue.sourceViewController as! EditEntry
        let index = saveTableView.saveIndex
        let update = saveTableView.saveItem
        let priority = saveTableView.savePriority
        
        arrToDo[index!].toDoItem = update!
        arrToDo[index!].itemPriority = priority!
        Todo().saveUserDefaults()
        updateTableData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let path = tableView.indexPathForSelectedRow
        let editTableView = segue.destinationViewController as! EditEntry
        
        editTableView.index = path?.row
        editTableView.editArray = arrToDo
    }
    
    override func viewDidAppear(animated: Bool) {
        
        updateTableData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "HelveticaNeue-Light" , size: 17)!]
        
        if let toDoData = NSUserDefaults.standardUserDefaults().objectForKey("toDoData") as? NSData {
            
            if let storedToDo = (NSKeyedUnarchiver.unarchiveObjectWithData(toDoData) as? [Todo]) {
                
                arrToDo = storedToDo
            }
        }
        
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        updateTableData()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrToDo.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if let cell = (tableView.dequeueReusableCellWithIdentifier("todoCell") as? ToDoCell){
            
            //let sortedToDo = arrToDo.sort {$0.itemPriority < $1.itemPriority}
            
            //print(String(arrToDo[indexPath.row].itemPriority))
            cell.configureCell(arrToDo[indexPath.row].toDoItem, complete: arrToDo[indexPath.row].complete, priority: arrToDo[indexPath.row].itemPriority, timestamp: arrToDo[indexPath.row].timeStamp)
            cell.doneSw.tag = indexPath.row
            return cell
       }
        
       return ToDoCell()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
        
            arrToDo.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            Todo().saveUserDefaults()
        
        } else if editingStyle == .Insert {
        
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        self.tableView.allowsSelectionDuringEditing = true
        
        
        if (tableView.editing) {
            
        self.performSegueWithIdentifier("edit", sender: nil)
            
        }
    }

    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let moveRow = arrToDo[fromIndexPath.row]
        arrToDo.removeAtIndex(fromIndexPath.row)
        arrToDo.insert(moveRow, atIndex: toIndexPath.row)
        Todo().saveUserDefaults()
        updateTableData()

    }
    
    func updateTableData() {
     
        self.toDoTable.reloadData()
        
    }
}
