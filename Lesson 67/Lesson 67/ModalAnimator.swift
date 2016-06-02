//
//  ModalAnimator.swift
//  Lesson 67
//
//  Created by Lucas Derraugh on 5/29/16.
//  Copyright © 2016 Lucas Derraugh. All rights reserved.
//

import Cocoa

private class BackgroundView: NSView {
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        wantsLayer = true
        layer?.backgroundColor = NSColor(white: 0, alpha: 0.5).CGColor
        alphaValue = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private override func mouseDown(theEvent: NSEvent) { }
}

class ModalAnimator: NSObject, NSViewControllerPresentationAnimator {
    private let backgroundView = BackgroundView(frame: CGRectZero)
    private var centerYConstraint: NSLayoutConstraint!
    
    func animatePresentationOfViewController(viewController: NSViewController, fromViewController: NSViewController) {
        let contentView = fromViewController.view
        backgroundView.frame = contentView.bounds
        backgroundView.autoresizingMask = [.ViewWidthSizable, .ViewHeightSizable]
        contentView.addSubview(backgroundView)
        
        let modalView = viewController.view
        modalView.translatesAutoresizingMaskIntoConstraints = false
        centerYConstraint = modalView.centerYAnchor.constraintEqualToAnchor(backgroundView.centerYAnchor, constant: 100)
        backgroundView.addSubview(modalView)
        NSLayoutConstraint.activateConstraints([
            modalView.centerXAnchor.constraintEqualToAnchor(backgroundView.centerXAnchor),
            centerYConstraint,
            modalView.widthAnchor.constraintEqualToAnchor(backgroundView.widthAnchor, constant: -100),
            modalView.heightAnchor.constraintEqualToAnchor(backgroundView.heightAnchor, constant: -100)
        ])
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.5
            self.backgroundView.animator().alphaValue = 1
            self.centerYConstraint.animator().constant = 0
        }, completionHandler: nil)
    }
    
    func animateDismissalOfViewController(viewController: NSViewController, fromViewController: NSViewController) {
        NSAnimationContext.runAnimationGroup({ _ in
            self.backgroundView.animator().alphaValue = 0
            self.centerYConstraint.animator().constant = 100
        }) { 
            self.backgroundView.removeFromSuperview()
        }
    }
}











