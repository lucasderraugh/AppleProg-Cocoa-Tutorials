//
//  AppDelegate.swift
//  Lesson 69
//
//  Created by Lucas Derraugh on 10/24/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    lazy var mainWindowController = MainWindowController()
    lazy var codeWindowController = CodeWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print(mainWindowController)
        print(codeWindowController)
        mainWindowController.showWindow(nil)
        codeWindowController.showWindow(nil)
    }

}

