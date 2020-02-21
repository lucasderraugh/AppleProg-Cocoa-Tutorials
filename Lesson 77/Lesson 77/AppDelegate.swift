//
//  AppDelegate.swift
//  Lesson 77
//
//  Created by Lucas Derraugh on 2/20/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    class var shared: AppDelegate {
        return NSApp.delegate as! AppDelegate
    }

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var wordCountLabel: NSTextField!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        NSApp.servicesProvider = ServiceProvider()
    }
    
    func setWordCount(_ count: Int) {
        wordCountLabel.integerValue = count
    }
}

