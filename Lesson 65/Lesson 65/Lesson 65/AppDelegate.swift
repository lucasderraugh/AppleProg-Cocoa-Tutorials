//
//  AppDelegate.swift
//  Lesson 65
//
//  Created by Lucas Derraugh on 10/16/15.
//  Copyright © 2015 Lucas Derraugh. All rights reserved.
//

import Cocoa
import LoggingFramework

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	@IBOutlet weak var window: NSWindow!

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		NSLog("This is our NSLog")
		Logging.testClassMethod()
		let log = Logging()
		log.testMethod()
	}

	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}


}

