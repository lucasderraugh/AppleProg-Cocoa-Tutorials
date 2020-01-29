//
//  TextService.h
//  TextService
//
//  Created by Lucas Derraugh on 1/23/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Foundation

class TextServiceDelegate: NSObject, NSXPCListenerDelegate {
    func listener(_ listener: NSXPCListener, shouldAcceptNewConnection newConnection: NSXPCConnection) -> Bool {
        newConnection.exportedInterface = NSXPCInterface(with: TextServiceProtocol.self)
        newConnection.exportedObject = TextService()
        newConnection.resume()
        
        return true
    }
}
