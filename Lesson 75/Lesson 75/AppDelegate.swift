//
//  AppDelegate.swift
//  Lesson 75
//
//  Created by Lucas Derraugh on 2/5/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var trackingButton: TrackingButton!
    
    @IBOutlet weak var timeLabel: NSTextField!
    var timer: Timer?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        button.target = self
        button.action = #selector(buttonPressed(_:))
        
        trackingButton.buttonPressed = {
            print("Tracking button pressed")
        }
        
        var time = 0
        timer = Timer(timeInterval: 1, repeats: true) { [weak self] _ in
            time += 1
            self?.timeLabel.integerValue = time
        }
        RunLoop.main.add(timer!, forMode: .default)
    }
    
    @objc func buttonPressed(_ sender: Any) {
        print("Normal button pressed")
    }
}

