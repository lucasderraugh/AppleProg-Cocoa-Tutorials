//
//  AppDelegate.swift
//  Lesson 79
//
//  Created by Lucas Derraugh on 3/13/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var stackView: NSStackView!
    lazy var windowController = WindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        window.autorecalculatesKeyViewLoop = true
        windowController.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func addField(_ sender: NSButton) {
        stackView.addArrangedSubview(NSButton(title: "Added!", target: nil, action: nil))
    }

}

