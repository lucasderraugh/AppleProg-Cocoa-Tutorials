//
//  AppDelegate.swift
//  Lesson 72
//
//  Created by Lucas Derraugh on 11/14/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let separator = NSBox()
        separator.boxType = .separator
        let grid = NSGridView(views: [
            [NSTextField(labelWithString: "Show scroll bars:"), NSButton(radioButtonWithTitle: "Automatically based on mouse or trackpad", target: nil, action: nil)],
            [NSGridCell.emptyContentView, NSButton(radioButtonWithTitle: "When scrolling", target: nil, action: nil)],
            [NSGridCell.emptyContentView, NSButton(radioButtonWithTitle: "Always", target: nil, action: nil)],
            [NSTextField(labelWithString: "Click in the scroll bar to:"), NSButton(radioButtonWithTitle: "Jump to the next page", target: nil, action: nil)],
            [separator],
            [NSTextField(labelWithString: "Button:"), NSButton(title: "Button", target: nil, action: nil)],
        ])
        
        grid.translatesAutoresizingMaskIntoConstraints = false
        grid.rowAlignment = .firstBaseline
        
        grid.column(at: 0).xPlacement = .trailing
        
        grid.row(at: 3).topPadding = 10
        
        let separatorRow = grid.row(at: 4)
        separatorRow.mergeCells(in: NSRange(location: 0, length: 2))
        separatorRow.topPadding = 16
        separatorRow.bottomPadding = 16
        
        let v = window.contentView!
        v.addSubview(grid)
        
        NSLayoutConstraint.activate([
            grid.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            grid.centerYAnchor.constraint(equalTo: v.centerYAnchor)
        ])
    }
}

