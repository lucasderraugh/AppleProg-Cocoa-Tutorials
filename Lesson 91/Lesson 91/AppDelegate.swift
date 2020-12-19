//
//  AppDelegate.swift
//  Lesson 91
//
//  Created by Lucas Derraugh on 12/18/20.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = ViewController()
    }
}

