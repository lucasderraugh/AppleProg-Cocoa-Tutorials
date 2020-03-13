//
//  WindowController.swift
//  Lesson 79
//
//  Created by Lucas Derraugh on 3/13/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()

//        let vc = ViewController()
//        vc.initialWindow = window
//        contentViewController = vc
    }
    
    override func showWindow(_ sender: Any?) {
        contentViewController = ViewController()
        super.showWindow(sender)
    }
    
    convenience init() {
        self.init(windowNibName: "WindowController")
    }
    
}
