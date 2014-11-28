//
//  SecondViewController.swift
//  Lesson 62
//
//  Created by Lucas Derraugh on 11/28/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {

    @IBOutlet weak var nameLabel: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.stringValue = representedObject as String
    }
    
}
