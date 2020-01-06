//
//  AppDelegate.swift
//  Lesson 73
//
//  Created by Lucas Derraugh on 12/12/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa
import TrollKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    lazy var trollWindowController = TrollWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        trollWindowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

