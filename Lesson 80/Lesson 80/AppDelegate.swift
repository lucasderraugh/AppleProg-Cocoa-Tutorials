//
//  AppDelegate.swift
//  Lesson 80
//
//  Created by Lucas Derraugh on 3/5/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
}

extension AppDelegate: NSTextFieldDelegate {
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if commandSelector == #selector(NSResponder.insertNewline) {
            textView.insertNewlineIgnoringFieldEditor(nil)
            return true
        }
        return false
    }
}
