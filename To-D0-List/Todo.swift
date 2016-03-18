//
//  todoClass.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/5/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import Foundation
import UIKit

class Todo: NSObject, NSCoding {
    
    private var _toDoItem: String =  ""
    private var _complete: Bool = false
    private var _itemPriority: UIImage!
    private var _timeStamp = NSDate()
    
    var toDoItem: String {
        
        get {
            
            return _toDoItem
            
        }
        
        set {
            
            self._toDoItem = newValue
            
        }
    }
    
    var timeStamp: NSDate {
        
        get {
            
            return _timeStamp
            
        }
        
    }

    var itemPriority: UIImage {
        
        get {
            
            return _itemPriority
            
        }
        
        set {
            
            self._itemPriority  = newValue
            
        }
    }
    
    var complete: Bool {
        
        get {
            
            
            return _complete
        }
        
        set {
            
            if complete {
            
                _complete = false
                
            } else {
                
                _complete = true
                
            }
            
        }
    }
    
    override init() {
        
    }
    
    init(toDoItem: String, complete: Bool, priority: UIImage) {
        
        _toDoItem = toDoItem
        _complete = complete
        _itemPriority = priority
        _timeStamp = NSDate()
    }
    
    func saveUserDefaults() {
        
        let toDoData = NSKeyedArchiver.archivedDataWithRootObject(arrToDo)
        NSUserDefaults.standardUserDefaults().setObject(toDoData, forKey: "toDoData")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        self.init()
        self._toDoItem = aDecoder.decodeObjectForKey("toDoItem") as! String
        self._complete = aDecoder.decodeObjectForKey("complete") as! Bool
        self._itemPriority = aDecoder.decodeObjectForKey("itemPriority") as! UIImage
        self._timeStamp = aDecoder.decodeObjectForKey("timeStamp") as! NSDate
    
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self._toDoItem, forKey: "toDoItem")
        aCoder.encodeObject(self._complete, forKey: "complete")
        aCoder.encodeObject(self._itemPriority, forKey: "itemPriority")
        aCoder.encodeObject(self._timeStamp, forKey: "timeStamp")
        
    }
    
}
    