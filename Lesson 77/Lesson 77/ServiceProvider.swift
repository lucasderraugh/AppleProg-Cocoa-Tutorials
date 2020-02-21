//
//  ServiceProvider.swift
//  Lesson 77
//
//  Created by Lucas Derraugh on 2/21/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ServiceProvider {
    @objc func countWords(_ pasteboard: NSPasteboard, userData: NSString, error: UnsafeMutablePointer<NSString>) {
        guard let documentURL = pasteboard.readObjects(forClasses: [NSURL.self], options: nil)?.first as? URL else {
            return
        }
        
        let text = (try? String(contentsOf: documentURL)) ?? ""
        update(NSPasteboard.general, with: text)
    }
    
    @objc func countWordsString(_ pasteboard: NSPasteboard, userData: NSString, error: UnsafeMutablePointer<NSString>) {
        guard let text = pasteboard.readObjects(forClasses: [NSString.self], options: nil)?.first as? String else {
            return
        }
        update(pasteboard, with: text)
    }
    
    private func update(_ pasteboard: NSPasteboard, with text: String) {
        let wordCount = NSSpellChecker.shared.countWords(in: text, language: nil)
        pasteboard.clearContents()
        pasteboard.setString("\(wordCount)", forType: .string)
        
        AppDelegate.shared.setWordCount(wordCount)
    }
}
