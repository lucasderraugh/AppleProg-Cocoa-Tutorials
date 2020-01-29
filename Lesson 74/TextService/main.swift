//
//  main.m
//  TextService
//
//  Created by Lucas Derraugh on 1/23/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Foundation

//let delegate = TextServiceDelegate()
let listener = NSXPCListener.service()
listener.delegate = TextServiceDelegate()
listener.resume()
print("Jonda")
