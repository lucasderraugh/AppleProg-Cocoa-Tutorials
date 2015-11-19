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
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        view.layer?.backgroundColor = NSColor.redColor().CGColor
    }
    
    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    @IBAction func pressView(sender: NSPressGestureRecognizer) {
        if sender.state == .Began {
            sender.view?.layer?.backgroundColor = NSColor.randomColor().CGColor
        }
    }
    
    @IBAction func panView(sender: NSPanGestureRecognizer) {
        let t = sender.translationInView(window.contentView as? NSView)
        sender.view!.frame = NSOffsetRect(sender.view!.frame, t.x, t.y)
        sender.setTranslation(NSZeroPoint, inView: nil)
    }
    
    @IBAction func rotateView(sender: NSRotationGestureRecognizer) {
        let rot = sender.rotation
        let view = sender.view!
        view.layer?.setAffineTransform(CGAffineTransformRotate(view.layer!.affineTransform(), rot))
        sender.rotation = 0
    }
    
    @IBAction func magnifyView(sender: NSMagnificationGestureRecognizer) {
        let mag = sender.magnification + 1.0
        let view = sender.view!
        view.layer?.setAffineTransform(CGAffineTransformScale(view.layer!.affineTransform(), mag, mag))
        sender.magnification = 0
    }
    
    func gestureRecognizer(gestureRecognizer: NSGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: NSGestureRecognizer) -> Bool {
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

