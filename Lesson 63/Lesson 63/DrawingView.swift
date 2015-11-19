//
//  DrawingView.swift
//  Lesson 63
//
//  Created by Lucas Derraugh on 12/31/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

import Cocoa

class DrawingView: NSView {
    
    override func mouseDown(theEvent: NSEvent) {
        let point = convertPoint(theEvent.locationInWindow, fromView: nil)
        if theEvent.modifierFlags & .AlternateKeyMask == .AlternateKeyMask {
            if let view = hitTest(point) {
                if view is CircleView {
                    removeCircle(view)
                    undoManager?.setActionName("Remove Circle")
                }
            }
        } else {
            let circle = CircleView(frame: NSMakeRect(point.x-15, point.y-15, 30, 30))
            addCircle(circle)
            undoManager?.setActionName("Add Circle")
        }
    }
    
    func addCircle(circle: NSView) {
        addSubview(circle)
        undoManager?.registerUndoWithTarget(self, selector: "removeCircle:", object: circle)
    }
    
    func removeCircle(circle: NSView) {
        circle.removeFromSuperview()
        undoManager?.prepareWithInvocationTarget(self).addCircle(circle)
    }

    override var wantsUpdateLayer: Bool {
        return true
    }
    
    override func updateLayer() {
        layer?.backgroundColor = NSColor.blackColor().CGColor
    }
    
}
