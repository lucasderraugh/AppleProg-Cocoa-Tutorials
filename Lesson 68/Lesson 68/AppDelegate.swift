//
//  AppDelegate.swift
//  Lesson 68
//
//  Created by Lucas Derraugh on 10/8/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = CollectionViewController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

