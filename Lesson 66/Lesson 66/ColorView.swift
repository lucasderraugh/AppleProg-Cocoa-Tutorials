//
//  ColorView.swift
//  Lesson 66
//
//  Created by Lucas Derraugh on 10/30/15.
//  Copyright © 2015 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ColorView: NSView {
	
	override class func initialize () {
		let t = UnsafeMutablePointer<time_t>.allocate(capacity: time_t(0))
		srand48(time(t))
	}

	override init(frame frameRect: NSRect) {
		super.init(frame: frameRect)
		
		self.wantsLayer = true
		self.layer = CALayer()
		
		let r = CGFloat(drand48())
		let g = CGFloat(drand48())
		let b = CGFloat(drand48())
		layer?.backgroundColor = NSColor(red: r, green: g, blue: b, alpha: 1).cgColor
	}

	required init?(coder: NSCoder) {
	    fatalError("init(coder:) has not been implemented")
	}
    
}
