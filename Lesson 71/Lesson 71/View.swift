//
//  View.swift
//  Lesson 71
//
//  Created by Lucas Derraugh on 11/7/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@IBDesignable
class View: NSView {
    
    @IBInspectable var backgroundColor: NSColor? {
        didSet { needsDisplay = true }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { needsDisplay = true }
    }
    
    @IBInspectable var borderColor: NSColor? {
        didSet { needsDisplay = true }
    }
    
    @IBInspectable dynamic var borderWidth: CGFloat = 0 {
        didSet { needsDisplay = true }
    }
    
    override func animation(forKey key: NSAnimatablePropertyKey) -> Any? {
        switch key {
        case "borderWidth":
            return CABasicAnimation()
        default:
            return super.animation(forKey: key)
        }
    }

    override var wantsUpdateLayer: Bool {
        return true
    }
    
    override func updateLayer() {
        guard let layer = layer else { return }
        layer.backgroundColor = backgroundColor?.cgColor
        layer.cornerRadius = cornerRadius
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
    }
}
