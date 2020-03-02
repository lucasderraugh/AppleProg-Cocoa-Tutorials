//
//  ViewController.swift
//  Lesson 78
//
//  Created by Lucas Derraugh on 2/26/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var tokenField: NSTokenField!
    
    var suggestions = [
        MailToken(name: "Lucas Derraugh", email: "lucas@derraugh.com"),
        MailToken(name: "Bob Barbara", email: "bob@barbara.com"),
        MailToken(name: "Lucas Beaverton", email: "lucas@beaverton.com"),
        MailToken(name: "Johnson", email: "john@johnson.com")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tokenField.delegate = self
        tokenField.completionDelay = 0.25
        tokenField.tokenStyle = .squared
    }
    
    func match(suggestion: String) -> MailToken? {
        suggestions.first { token in
            // This should really just be checking for a valid email format
            token.nameEmail == suggestion || token.emailName == suggestion || token.editingString == suggestion
        }
    }
    
    func matchStrings(substring: String) -> [String] {
        suggestions.compactMap { token in
            if token.name.hasPrefix(substring) { return token.nameEmail }
            else if token.email.hasPrefix(substring) { return token.emailName }
            else { return nil }
        }
    }
    
    @objc func removeAddress(_ sender: NSMenuItem) {
        let fieldEditor = tokenField.cell?.fieldEditor(for: tokenField)
        guard let selectedRange = fieldEditor?.selectedRanges, var tokens = tokenField.objectValue as? [Any] else {
            return
        }
        
        for value in selectedRange {
            tokens.remove(at: value.rangeValue.location)
        }
        
        tokenField.objectValue = tokens
    }
    
    @objc func copyAddress(_ sender: NSMenuItem) {
        guard let token = sender.representedObject as? MailToken else { return }
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(token.email, forType: .string)
    }
}

extension ViewController: NSTokenFieldDelegate {
    // 1
    func tokenField(_ tokenField: NSTokenField, completionsForSubstring substring: String, indexOfToken tokenIndex: Int, indexOfSelectedItem selectedIndex: UnsafeMutablePointer<Int>?) -> [Any]? {
        matchStrings(substring: substring)
    }
    
    func tokenField(_ tokenField: NSTokenField, shouldAdd tokens: [Any], at index: Int) -> [Any] {
        guard let emails = tokens as? [String] else { return [] }
        return emails.compactMap { match(suggestion: $0) }
    }
    
    // 2
    func tokenField(_ tokenField: NSTokenField, displayStringForRepresentedObject representedObject: Any) -> String? {
        guard let mailToken = representedObject as? MailToken else { return nil }
        return mailToken.name
    }
    
    func tokenField(_ tokenField: NSTokenField, editingStringForRepresentedObject representedObject: Any) -> String? {
        guard let mailToken = representedObject as? MailToken else { return nil }
        return mailToken.editingString
    }
    
    // 3
    func tokenField(_ tokenField: NSTokenField, hasMenuForRepresentedObject representedObject: Any) -> Bool {
        true
    }
    
    func tokenField(_ tokenField: NSTokenField, menuForRepresentedObject representedObject: Any) -> NSMenu? {
        let menu = NSMenu()
        menu.addItem(withTitle: "Remove Address", action: #selector(removeAddress), keyEquivalent: "")
        
        let menuItem = NSMenuItem(title: "Copy Address", action: #selector(copyAddress), keyEquivalent: "")
        menuItem.representedObject = representedObject
        menu.addItem(menuItem)
        
        return menu
    }
}
