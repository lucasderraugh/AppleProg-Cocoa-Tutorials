//
//  InvalidatingView.swift
//  Lesson 94
//
//  Created by Lucas Derraugh on 3/31/22.
//

import Cocoa

class InvalidatingView: NSView {
    
    @Invalidating(.display) var backgroundColor: NSColor = .red
    @Invalidating(.intrinsicContentSize, .printy) var isBig: Bool = false

    override var wantsUpdateLayer: Bool {
        true
    }
    
    override func updateLayer() {
        guard let layer = layer else { return }
        layer.backgroundColor = backgroundColor.cgColor
    }
    
    override var intrinsicContentSize: NSSize {
        isBig ? NSSize(width: 400, height: 300) : NSSize(width: 140, height: 100)
    }
}

extension NSViewInvalidating where Self == Printy {

    public static var printy: Printy { Printy() }
}

public struct Printy : NSViewInvalidating {
    public func invalidate(view: NSView) {
        print("Hello")
    }
}
