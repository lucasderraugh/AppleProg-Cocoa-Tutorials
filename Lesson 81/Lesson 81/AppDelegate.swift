//
//  AppDelegate.swift
//  Lesson 81
//
//  Created by Lucas Derraugh on 4/3/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var windowController = WindowController()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        windowController.showWindow(nil)
    }
}

