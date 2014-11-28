//
//  ViewController.swift
//  Lesson 62
//
//  Created by Lucas Derraugh on 11/28/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var nameField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepareForSegue(segue: NSStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "DetailSegue" {
            (segue.destinationController as NSViewController).representedObject = nameField.stringValue
        }
    }

}

