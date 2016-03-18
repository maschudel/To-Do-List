//
//  myCustomButton.swift
//  To-D0-List
//
//  Created by Marc Schudel on 3/15/16.
//  Copyright © 2016 Marc Schudel. All rights reserved.
//

import UIKit

import UIKit

class myCustomButton: UIButton {
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = 5.0
        self.backgroundColor = UIColor(red: 46.0/255.0, green: 135.0/255.0, blue: 195.0/255.0, alpha: 1.0)
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
    }
    
}
