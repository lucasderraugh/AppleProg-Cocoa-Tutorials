//
//  TrackingButton.swift
//  Lesson 75
//
//  Created by Lucas Derraugh on 2/5/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class TrackingButton: NSView {
    
    var highlight = false {
        didSet {
            if oldValue != highlight {
                needsDisplay = true
            }
        }
    }
    var buttonPressed: (() -> Void)?
    
    override var wantsUpdateLayer: Bool {
        true
    }
    
    override func updateLayer() {
        guard let layer = layer else { return }
        let color: NSColor = highlight ? .controlAccentColor : .white
        layer.backgroundColor = color.cgColor
        layer.cornerRadius = 4
    }
    
//    override func mouseDown(with event: NSEvent) {
//        highlight = true
//    }
//
//    override func mouseDragged(with event: NSEvent) {
//        let mouseLocation = convert(event.locationInWindow, from: nil)
//        let isInside = isMousePoint(mouseLocation, in: bounds)
//        highlight = isInside
//    }
//
//    override func mouseUp(with event: NSEvent) {
//        let mouseLocation = convert(event.locationInWindow, from: nil)
//        let isInside = isMousePoint(mouseLocation, in: bounds)
//        if isInside {
//            buttonPressed?()
//        }
//        highlight = false
//    }
    
    override func mouseDown(with event: NSEvent) {
        guard let window = window else { return }
        highlight = true
        loop: while let trackingEvent = window.nextEvent(matching: [.leftMouseDragged, .leftMouseUp, .keyDown]) {
            let mouseLocation = convert(trackingEvent.locationInWindow, from: nil)
            let isInside = isMousePoint(mouseLocation, in: bounds)
            switch trackingEvent.type {
            case .leftMouseDragged:
                highlight = isInside
            case .leftMouseUp:
                if isInside {
                    buttonPressed?()
                }
                highlight = false
                break loop
            case .keyDown:
                NSSound.beep()
            default:
                break
            }
        }
    }
}
