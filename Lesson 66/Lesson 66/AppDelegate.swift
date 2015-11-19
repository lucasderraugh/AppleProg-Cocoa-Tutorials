//
//  AppDelegate.swift
//  Lesson 66
//
//  Created by Lucas Derraugh on 10/30/15.
//  Copyright © 2015 Lucas Derraugh. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!
	var leftView = ColorView()
	var rightView = ColorView()

	func applicationDidFinishLaunching(aNotification: NSNotification) {
		leftView.translatesAutoresizingMaskIntoConstraints = false
		rightView.translatesAutoresizingMaskIntoConstraints = false
		
		guard let view = window.contentView else { return }
		
		let leftConstraints: [NSLayoutConstraint] = [
			leftView.topAnchor.constraintEqualToAnchor(view.topAnchor),
			leftView.leftAnchor.constraintEqualToAnchor(view.leftAnchor),
			leftView.rightAnchor.constraintEqualToAnchor(view.centerXAnchor),
			leftView.widthAnchor.constraintGreaterThanOrEqualToConstant(150),
			leftView.heightAnchor.constraintEqualToConstant(100)
		]
		
		let rightConstraints: [NSLayoutConstraint] = [
			rightView.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor, constant: 50),
			rightView.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor),
			rightView.widthAnchor.constraintEqualToConstant(100),
			rightView.heightAnchor.constraintEqualToConstant(100)
		]
		
		view.addSubview(leftView)
		view.addSubview(rightView)
		
		NSLayoutConstraint.activateConstraints(leftConstraints)
		NSLayoutConstraint.activateConstraints(rightConstraints)
	}
}




















