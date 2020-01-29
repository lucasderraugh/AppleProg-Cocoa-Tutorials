//
//  UppercaseUtility.swift
//  Lesson 74
//
//  Created by Lucas Derraugh on 1/23/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Foundation
import TextService

class UppercaseUtility {
    class func uppercase(_ string: String, reply: @escaping (String) -> Void) {
        let connection = NSXPCConnection(serviceName: "com.lucasderraugh.TextService")
        connection.remoteObjectInterface = NSXPCInterface(with: TextServiceProtocol.self)
        connection.resume()
        
        let service = connection.remoteObjectProxyWithErrorHandler { error in
            print("Error: \(error)")
        } as? TextServiceProtocol
        
        service?.uppercase(string, withReply: reply)
    }
}
