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

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		leftView.translatesAutoresizingMaskIntoConstraints = false
		rightView.translatesAutoresizingMaskIntoConstraints = false
		
		guard let view = window.contentView else { return }
		
		let leftConstraints = [
			leftView.topAnchor.constraint(equalTo: view.topAnchor),
			leftView.leftAnchor.constraint(equalTo: view.leftAnchor),
			leftView.rightAnchor.constraint(equalTo: view.centerXAnchor),
			leftView.widthAnchor.constraint(greaterThanOrEqualToConstant: 150),
			leftView.heightAnchor.constraint(equalToConstant: 100)
		]
		
		let rightConstraints = [
			rightView.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
			rightView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			rightView.widthAnchor.constraint(equalToConstant: 100),
			rightView.heightAnchor.constraint(equalToConstant: 100)
		]
		
		view.addSubview(leftView)
		view.addSubview(rightView)
        
		NSLayoutConstraint.activate(leftConstraints + rightConstraints)
	}
}




















