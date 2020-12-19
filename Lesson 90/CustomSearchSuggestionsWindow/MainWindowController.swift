//
//  MainWindowController.swift
//  CustomSearchSuggestionsWindow
//
//  Created by Lucas Derraugh on 10/25/20.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet private weak var searchField: NSTextField!
    @IBOutlet private weak var resultsLabel: NSTextField!
    
    private let suggestions = ["Al", "Bethany", "Billy", "Bob", "Bobby", "Lucas"]
    
    lazy var suggestionsWindowController = SuggestionsWindowController()
    
    convenience init() {
        self.init(windowNibName: String(describing: Self.self))
    }
    
    private func suggestions(for searchString: String) -> [String] {
        if searchString.isEmpty { return [] }
        let results = suggestions.filter { string in
            guard let range = string.range(of: searchString, options: [.anchored, .caseInsensitive]) else { return false }
            return !range.isEmpty
        }
        return results
    }
}

extension MainWindowController: NSControlTextEditingDelegate {
    func controlTextDidChange(_ obj: Notification) {
        let filteredSuggestsions = suggestions(for: searchField.stringValue)
        suggestionsWindowController.showSuggestions(filteredSuggestsions, for: searchField)
    }
    
    func control(_ control: NSControl, textView: NSTextView, doCommandBy commandSelector: Selector) -> Bool {
        if commandSelector == #selector(moveUp(_:)) {
            suggestionsWindowController.moveUp()
            return true
        }
        if commandSelector == #selector(moveDown(_:)) {
            suggestionsWindowController.moveDown()
            return true
        }
        if commandSelector == #selector(insertNewline(_:)) {
            guard let suggestion = suggestionsWindowController.currentSuggestion else { return false }
            searchField.stringValue = suggestion
            resultsLabel.stringValue = suggestion
            suggestionsWindowController.orderOut()
            return true
        }
        
        return false
    }
}
