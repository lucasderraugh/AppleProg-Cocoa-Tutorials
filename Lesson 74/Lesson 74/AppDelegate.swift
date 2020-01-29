//
//  AppDelegate.swift
//  Lesson 74
//
//  Created by Lucas Derraugh on 1/19/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var outputLabel: NSTextField!
    @IBOutlet weak var inputField: NSTextField!
    
    @IBAction func uppercase(_ sender: Any) {
        UppercaseUtility.uppercase(inputField.stringValue) { [weak self] uppercased in
            DispatchQueue.main.async {
                self?.outputLabel.stringValue = uppercased
            }
        }
    }
}

