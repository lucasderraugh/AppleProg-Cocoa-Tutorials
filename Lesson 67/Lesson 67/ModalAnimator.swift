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
        layer?.backgroundColor = NSColor(white: 0, alpha: 0.5).cgColor
        alphaValue = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func mouseDown(with theEvent: NSEvent) { }
}

class ModalAnimator: NSObject, NSViewControllerPresentationAnimator {
    fileprivate let backgroundView = BackgroundView(frame: .zero)
    fileprivate var centerYConstraint: NSLayoutConstraint!
    
    func animatePresentation(of viewController: NSViewController, from fromViewController: NSViewController) {
        let contentView = fromViewController.view
        backgroundView.frame = contentView.bounds
        backgroundView.autoresizingMask = [.viewWidthSizable, .viewHeightSizable]
        contentView.addSubview(backgroundView)
        
        let modalView = viewController.view
        modalView.translatesAutoresizingMaskIntoConstraints = false
        centerYConstraint = modalView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: 100)
        backgroundView.addSubview(modalView)
        NSLayoutConstraint.activate([
            modalView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            centerYConstraint,
            modalView.widthAnchor.constraint(equalTo: backgroundView.widthAnchor, constant: -100),
            modalView.heightAnchor.constraint(equalTo: backgroundView.heightAnchor, constant: -100)
        ])
        
        NSAnimationContext.runAnimationGroup({ context in
            context.duration = 0.5
            self.backgroundView.animator().alphaValue = 1
            self.centerYConstraint.animator().constant = 0
        }, completionHandler: nil)
    }
    
    func animateDismissal(of viewController: NSViewController, from fromViewController: NSViewController) {
        NSAnimationContext.runAnimationGroup({ _ in
            self.backgroundView.animator().alphaValue = 0
            self.centerYConstraint.animator().constant = 100
        }, completionHandler: {
            self.backgroundView.removeFromSuperview()
        })
    }
}











