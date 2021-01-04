//
//  AppDelegate.swift
//  Lesson 92
//
//  Created by Lucas Derraugh on 12/30/20.
//

import Cocoa

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet var window: NSWindow!
    @IBOutlet weak var button: NSButton!
    @IBOutlet weak var label: NSTextField!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        button.symbolConfiguration = NSImage.SymbolConfiguration(textStyle: .title1)
        button.image = NSImage(systemSymbolName: "square.and.arrow.up", accessibilityDescription: nil)
        label.font = NSFont.preferredFont(forTextStyle: .title1)
    }
}

