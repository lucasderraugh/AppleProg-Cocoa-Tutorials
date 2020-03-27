//
//  CustomTextField.swift
//  Lesson 80
//
//  Created by Lucas Derraugh on 3/25/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import AppKit

class CustomFieldCell: NSTextFieldCell {
    static var customFieldEditor: CustomFieldEditor = {
        let fieldEditor = CustomFieldEditor()
        return fieldEditor
    }()
    
    override func fieldEditor(for controlView: NSView) -> NSTextView? {
        return Self.customFieldEditor
    }
}

class CustomFieldEditor: NSTextView {
    let smileyStorage = CustomTextStorage()
    override var writablePasteboardTypes: [NSPasteboard.PasteboardType] { [] }
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        commonInit()
    }
    
    override init(frame frameRect: NSRect, textContainer container: NSTextContainer?) {
        super.init(frame: frameRect, textContainer: container)
        commonInit()
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        guard let length = textStorage?.length else { return }
        let color = length < 8 ? NSColor.red : NSColor.green
        color.setStroke()
        NSBezierPath(roundedRect: bounds, xRadius: 2, yRadius: 2).stroke()
    }
    
    private func commonInit() {
        layoutManager?.replaceTextStorage(smileyStorage)
        isFieldEditor = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomTextStorage: NSTextStorage {

    private var storage = NSMutableAttributedString()
    
    override var string: String {
        return storage.string
    }
    
    override func attributes(at location: Int, effectiveRange range: NSRangePointer?) -> [NSAttributedString.Key : Any] {
        return storage.attributes(at: location, effectiveRange: range)
    }
    
    override func replaceCharacters(in range: NSRange, with str: String) {
        beginEditing()
        let replacementString = str.replacingOccurrences(of: " ", with: "_")
        storage.replaceCharacters(in: range, with: replacementString)
        edited(.editedCharacters, range: range, changeInLength: (str as NSString).length - range.length)
        endEditing()
    }
    
    override func setAttributes(_ attrs: [NSAttributedString.Key : Any]?, range: NSRange) {
        beginEditing()
        storage.setAttributes(attrs, range: range)
        edited(.editedAttributes, range: range, changeInLength: 0)
        endEditing()
    }
}
