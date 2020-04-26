//
//  TabViewController.swift
//  Lesson 81
//
//  Created by Lucas Derraugh on 4/16/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class TabViewController: NSTabViewController {

    override func viewDidLoad() {
        // Could set tabView subclass here if desired
        super.viewDidLoad()
    }

    let blankView = NSView()
    
    override func transition(from fromViewController: NSViewController, to toViewController: NSViewController, options: NSViewController.TransitionOptions = [], completionHandler completion: (() -> Void)? = nil) {
        
        guard
            let window = self.view.window,
            let superview = fromViewController.view.superview else { return }
        
        let fromView = fromViewController.view
        let toView = toViewController.view
        
        let difference = toView.frame.differenceInSize(from: fromView.frame)
        
        // Flawed code with re-entrace issues (double adding subviews when quick switching)

        fromView.removeFromSuperview()
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 1
            context.allowsImplicitAnimation = true

            var windowFrame = window.frame
            windowFrame.origin.y = windowFrame.minY - difference.height
            windowFrame.size = NSSize(width: windowFrame.width + difference.width, height: windowFrame.height + difference.height)
            window.setFrame(windowFrame, display: true)
        }, completionHandler: {
            superview.addSubview(toView)
            completion?()
        })
    }
}

extension NSRect {
    // Final - initial
    func differenceInSize(from: NSRect) -> NSSize {
        NSSize(width: self.width - from.width, height: self.height - from.height)
    }
}
