//
//  CodeWindowController.swift
//  Lesson 69
//
//  Created by Lucas Derraugh on 10/24/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class CodeWindowController: NSWindowController {
    
    convenience init() {
        self.init(windowNibName: "")
    }
    
    override func loadWindow() {
        self.window = Window(contentRect: NSMakeRect(100, 100, 400, 300), styleMask: [], backing: .buffered, defer: true)
    }

    override func windowDidLoad() {
        super.windowDidLoad()
    
        contentViewController = ViewController()
    }

}
