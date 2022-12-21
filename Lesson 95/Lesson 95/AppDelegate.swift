//
//  AppDelegate.swift
//  Lesson 95
//
//  Created by Lucas Derraugh on 4/8/22.
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
