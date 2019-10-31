//
//  AppDelegate.swift
//  Lesson 70
//
//  Created by Lucas Derraugh on 10/16/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    private let systemIconWindowController = SystemIconWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        systemIconWindowController.showWindow(nil)
    }
}

