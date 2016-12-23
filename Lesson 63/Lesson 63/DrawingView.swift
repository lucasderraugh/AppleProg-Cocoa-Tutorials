//
//  DrawingView.swift
//  Lesson 63
//
//  Created by Lucas Derraugh on 12/31/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

import Cocoa

class DrawingView: NSView {
    
    override func mouseDown(with theEvent: NSEvent) {
        let point = convert(theEvent.locationInWindow, from: nil)
        if theEvent.modifierFlags.contains(.option) {
            if let view = hitTest(point), view is CircleView {
                removeCircle(view)
                undoManager?.setActionName("Remove Circle")
            }
        } else {
            let circle = CircleView(frame: NSMakeRect(point.x-15, point.y-15, 30, 30))
            addCircle(circle)
            undoManager?.setActionName("Add Circle")
        }
    }
    
    func addCircle(_ circle: NSView) {
        addSubview(circle)
        undoManager?.registerUndo(withTarget: self, selector: #selector(removeCircle(_:)), object: circle)
    }
    
    func removeCircle(_ circle: NSView) {
        circle.removeFromSuperview()
        (undoManager?.prepare(withInvocationTarget: self) as AnyObject).addCircle(circle)
    }

    override var wantsUpdateLayer: Bool {
        return true
    }
    
    override func updateLayer() {
        layer?.backgroundColor = NSColor.black.cgColor
    }
    
}
