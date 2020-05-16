//
//  WindowController.swift
//  Lesson 83
//
//  Created by Lucas Derraugh on 5/14/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    @IBOutlet weak var label: NSTextField!
    
    var counter = 0
    var strings = ["This", "Is", "A", "Crash"]
    
    convenience init() {
        self.init(windowNibName: "WindowController")
    }
    
    @IBAction func buttonPressed(_ sender: NSButton) {
        label.stringValue = strings[counter]
        counter += 1
    }
}
