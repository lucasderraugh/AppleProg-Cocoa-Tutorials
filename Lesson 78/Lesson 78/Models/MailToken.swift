//
//  MailToken.swift
//  Lesson 78
//
//  Created by Lucas Derraugh on 2/27/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Foundation

struct MailToken {
    let name: String
    let email: String
    
    var editingString: String {
        return "\(name) <\(email)>"
    }
    
    var nameEmail: String {
        "\(name) - \(email)"
    }
    
    var emailName: String {
        "\(email) - \(name)"
    }
}
