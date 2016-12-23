//
//  AppDelegate.swift
//  Lesson 67
//
//  Created by Lucas Derraugh on 5/29/16.
//  Copyright © 2016 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let initialVC = InitialViewController()


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        window.contentViewController = initialVC
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

