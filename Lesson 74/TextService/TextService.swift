//
//  TextService.m
//  TextService
//
//  Created by Lucas Derraugh on 1/23/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Foundation

class TextService: NSObject, TextServiceProtocol {
    func uppercase(_ string: String, withReply reply: @escaping (String) -> Void) {
        reply(string.uppercased())
    }
}
