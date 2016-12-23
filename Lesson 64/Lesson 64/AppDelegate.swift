//
//  AppDelegate.swift
//  Lesson 64
//
//  Created by Lucas Derraugh on 5/13/15.
//  Copyright (c) 2015 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSGestureRecognizerDelegate {
    
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var view: NSView!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    @IBAction func pressView(_ sender: NSPressGestureRecognizer) {
        if sender.state == .began {
            sender.view?.layer?.backgroundColor = NSColor.randomColor().cgColor
        }
    }
    
    @IBAction func panView(_ sender: NSPanGestureRecognizer) {
        guard let contentView = window.contentView else { return }
        let t = sender.translation(in: contentView)
        sender.view!.frame = NSOffsetRect(sender.view!.frame, t.x, t.y)
        sender.setTranslation(NSZeroPoint, in: nil)
    }
    
    @IBAction func rotateView(_ sender: NSRotationGestureRecognizer) {
        let rot = sender.rotation
        let view = sender.view!
        view.layer?.setAffineTransform(view.layer!.affineTransform().rotated(by: rot))
        sender.rotation = 0
    }
    
    @IBAction func magnifyView(_ sender: NSMagnificationGestureRecognizer) {
        let mag = sender.magnification + 1.0
        let view = sender.view!
        view.layer?.setAffineTransform(view.layer!.affineTransform().scaledBy(x: mag, y: mag))
        sender.magnification = 0
    }
    
    func gestureRecognizer(_ gestureRecognizer: NSGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: NSGestureRecognizer) -> Bool {
        return true
    }
    
}

extension NSColor {
    class func randomColor() -> NSColor {
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        return NSColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

