//
//  AppDelegate.swift
//  Lesson 93
//
//  Created by Lucas Derraugh on 1/24/21.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!

    @IBAction func subtitleChanged(_ sender: NSTextField) {
        window.subtitle = sender.stringValue
    }
    
    @IBAction func toolbarStyleClicked(_ sender: NSButton) {
        let style: NSWindow.ToolbarStyle
        switch sender.tag {
        case 0: style = .automatic
        case 1: style = .expanded
        case 2: style = .preference
        case 3: style = .unified
        case 4: style = .unifiedCompact
        default: style = .automatic
        }
        
        window.toolbarStyle = style
    }
    
    @IBAction func titlebarSeparatorStyleClicked(_ sender: NSButton) {
        let style: NSTitlebarSeparatorStyle
        switch sender.tag {
        case 0: style = .automatic
        case 1: style = .line
        case 2: style = .none
        case 3: style = .shadow
        default: style = .automatic
        }
        
        window.titlebarSeparatorStyle = style
    }
}

