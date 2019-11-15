//
//  AppDelegate.swift
//  Lesson 71
//
//  Created by Lucas Derraugh on 11/6/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var box: NSBox!
    @IBOutlet weak var view: View!
    
    
    @IBAction func animate(_ sender: Any) {
        NSAnimationContext.runAnimationGroup { context in
            context.allowsImplicitAnimation = true
            context.duration = 0.5
            let value = CGFloat(arc4random_uniform(50))
            box.animator().borderWidth = value
            view.animator().borderWidth = value
        }
    }
}

