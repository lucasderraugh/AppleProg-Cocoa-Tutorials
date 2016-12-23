//
//  Logging.swift
//  LoggingFramework
//
//  Created by Lucas Derraugh on 10/16/15.
//  Copyright © 2015 Lucas Derraugh. All rights reserved.
//

import Cocoa

public func NSLog(_ string: String) {
	let name = Bundle.main.infoDictionary!["CFBundleName"] as! String
	print("\(Date()) \(name) \(string)")
}

open class Logging {
	public init() {
		
	}
	
	open func testMethod() {
		print("Test Method")
	}
	
	open class func testClassMethod() {
		NSAlert().runModal()
	}
}
