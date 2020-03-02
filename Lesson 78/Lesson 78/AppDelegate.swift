//
//  AppDelegate.swift
//  Lesson 78
//
//  Created by Lucas Derraugh on 2/26/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        window.contentViewController = ViewController()
        window.makeKeyAndOrderFront(nil)
    }
}

