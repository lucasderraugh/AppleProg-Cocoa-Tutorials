//
//  ButtonLabelCell.swift
//  Lesson 95
//
//  Created by Lucas Derraugh on 4/8/22.
//

import Cocoa

class ButtonLabelCell: NSTableCellView {

    @IBOutlet private weak var button: NSButton!
    @IBOutlet private weak var label: NSTextField!
    
    func configure(_ string: String) {
        button.title = string
        label.stringValue = string
    }
}
