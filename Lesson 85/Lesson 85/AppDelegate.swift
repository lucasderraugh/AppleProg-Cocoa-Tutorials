//
//  AppDelegate.swift
//  Lesson 85
//
//  Created by Lucas Derraugh on 6/10/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func newProjectButtonPressed(_ sender: Any) {
        let savePanel = NSSavePanel()
        savePanel.accessoryView = AccessoryViewController.viewForPanel(gitEnabled: false) { gitEnabled in
            print("\(gitEnabled ? "Enabled" : "Disabled") git repo for project")
        }
        savePanel.beginSheetModal(for: window) { response in
            //
        }
    }
    
}

