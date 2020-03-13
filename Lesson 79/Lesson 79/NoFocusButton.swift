//
//  NoFocusButton.swift
//  Lesson 79
//
//  Created by Lucas Derraugh on 3/13/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class NoFocusButton: NSButton {

    override var acceptsFirstResponder: Bool {
        return false
    }
    
}
