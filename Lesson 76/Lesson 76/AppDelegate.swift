//
//  AppDelegate.swift
//  Lesson 76
//
//  Created by Lucas Derraugh on 2/12/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    var counter = 0
    
    @IBAction func changeCursor(_ sender: NSButton) {
        switch counter {
        case 0:
            NSCursor.openHand.push()
        case 1:
            NSCursor.closedHand.push()
        default:
            NSCursor.pop()
        }
        counter = (counter + 1) % 4
    }
    
    @IBAction func hideCursor(_ sender: NSButton) {
        NSCursor.hide()
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            NSCursor.unhide()
        }
    }
}

