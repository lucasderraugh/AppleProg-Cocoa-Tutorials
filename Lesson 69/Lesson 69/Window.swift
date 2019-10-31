//
//  Window.swift
//  Lesson 69
//
//  Created by Lucas Derraugh on 10/24/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

class Window: NSWindow {
    override init(contentRect: NSRect, styleMask style: NSWindow.StyleMask, backing backingStoreType: NSWindow.BackingStoreType, defer flag: Bool) {
        super.init(contentRect: contentRect, styleMask: [.fullSizeContentView], backing: .buffered, defer: true)
        isMovableByWindowBackground = true
        backgroundColor = NSColor.systemGray
    }
}
