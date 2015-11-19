//
//  Logging.swift
//  LoggingFramework
//
//  Created by Lucas Derraugh on 10/16/15.
//  Copyright © 2015 Lucas Derraugh. All rights reserved.
//

import Cocoa

public func NSLog(string: String) {
	let name = NSBundle.mainBundle().infoDictionary!["CFBundleName"] as! String
	print("\(NSDate()) \(name) \(string)")
}

public class Logging {
	public init() {
		
	}
	
	public func testMethod() {
		print("Test Method")
	}
	
	public class func testClassMethod() {
		NSAlert().runModal()
	}
}