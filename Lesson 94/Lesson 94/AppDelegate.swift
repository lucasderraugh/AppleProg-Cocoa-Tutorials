//
//  AppDelegate.swift
//  Lesson 94
//
//  Created by Lucas Derraugh on 9/16/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    
    func applicationWillFinishLaunching(_ notification: Notification) {
        window.contentViewController = ViewController()
    }

    func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
        return true
    }
}

