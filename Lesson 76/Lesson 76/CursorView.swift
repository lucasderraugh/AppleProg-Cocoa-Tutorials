//
//  CursorView.swift
//  Lesson 76
//
//  Created by Lucas Derraugh on 2/13/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class CursorView: NSView {

    var points = [NSPoint]()
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        
        NSColor.lightGray.setFill()
        bounds.fill()
        NSColor.red.setFill()
        for p in points {
            let circle = NSBezierPath(ovalIn: NSRect(x: p.x - 3, y: p.y - 3, width: 6, height: 6))
            circle.fill()
        }
    }
    
    override func mouseDown(with event: NSEvent) {
        super.mouseDown(with: event)
        points.append(convert(event.locationInWindow, from: nil))
        needsDisplay = true
    }
    
    override func resetCursorRects() {
        let cursor = NSCursor(image: NSImage(named: "Tree")!, hotSpot: NSPoint(x: 6, y: 0))
        addCursorRect(bounds, cursor: cursor)
    }
}
