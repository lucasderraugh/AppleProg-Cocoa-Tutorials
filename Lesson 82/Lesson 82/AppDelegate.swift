//
//  AppDelegate.swift
//  Lesson 82
//
//  Created by Lucas Derraugh on 5/1/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        stuff()
    }
    
    func stuff() {
        fatalError()
    }

    // This was a sample project for notarization
}

