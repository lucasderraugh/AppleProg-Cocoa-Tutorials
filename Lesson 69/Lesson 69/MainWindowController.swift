//
//  MainWindowController.swift
//  Lesson 69
//
//  Created by Lucas Derraugh on 10/24/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    convenience init() {
        self.init(windowNibName: "MainWindowController")
    }
    
//    override var windowNibName: NSNib.Name? {
//        "MainWindowController"
//    }

    override func windowDidLoad() {
        super.windowDidLoad()

        contentViewController = ViewController()
    }
    
}
