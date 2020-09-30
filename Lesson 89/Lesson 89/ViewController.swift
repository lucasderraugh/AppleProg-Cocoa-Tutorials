//
//  ViewController.swift
//  Lesson 89
//
//  Created by Lucas Derraugh on 9/17/20.
//

import Cocoa
import LocalAuthentication

let keychainKey = "com.lucasderraugh.Lesson_89.keychain"

class ViewController: NSViewController {
    
    @IBOutlet weak var entryField: NSTextField!
    @IBOutlet weak var statusLabel: NSTextField!
    
    @IBAction func storeEntry(_ sender: Any) {
        let entry = entryField.stringValue
        if entry.isEmpty {
            KeychainHelper.remove(key: keychainKey)
            updateStatus("Entry Removed!")
        } else {
            let result = KeychainHelper.createEntry(key: keychainKey, data: Data(entry.utf8))
            updateStatus(result == noErr ? "Entry Stored!" : "Failed to store entry: \(result)")
            entryField.stringValue = ""
        }
    }
    
    @IBAction func readEntry(_ sender: Any) {
        let context = LAContext()
        var error: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            let accessControl = KeychainHelper.secAccessControl
            context.evaluateAccessControl(accessControl, operation: .useItem, localizedReason: "access app password") { (success, error) in
                let result: String
                if success, let data = KeychainHelper.load(key: keychainKey, context: context) {
                    let dataStr = String(decoding: data, as: UTF8.self)
                    result = "Result: \(dataStr)"
                } else {
                    result = "Can't read entry, error: \(error?.localizedDescription ?? "-")"
                }
                DispatchQueue.main.async { [weak self] in
                    self?.updateStatus(result)
                }
            }
        } else {
            updateStatus("Can't read entry: \(error?.localizedDescription ?? "")")
        }
    }
    
    private func updateStatus(_ string: String) {
        statusLabel.stringValue = string
    }
}
