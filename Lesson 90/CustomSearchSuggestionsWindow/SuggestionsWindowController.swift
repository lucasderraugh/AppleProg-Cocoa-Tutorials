//
//  SuggestionsWindowController.swift
//  CustomSearchSuggestionsWindow
//
//  Created by Lucas Derraugh on 11/3/20.
//

import Cocoa

class SuggestionsWindowController: NSWindowController {
    
    private var suggestions = [String]()
    
    private lazy var tableView: NSTableView = {
        let t = NSTableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier("Main")))
        t.usesAutomaticRowHeights = true
        t.register(TableCellView.nib, forIdentifier: TableCellView.identifier)
        t.dataSource = self
        t.delegate = self
        return t
    }()
    
    convenience init() {
        self.init(windowNibName: String(describing: Self.self))
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        guard let contentView = window?.contentView else { return }
        
        contentView.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func orderOut() {
        tableView.deselectAll(nil)
        window?.orderOut(nil)
    }
    
    func showSuggestions(_ suggestions: [String], for textField: NSTextField) {
        if suggestions.isEmpty {
            orderOut()
        } else {
            self.suggestions = suggestions
            guard let textFieldWindow = textField.window, let window = self.window else { return }
            var textFieldRect = textField.convert(textField.bounds, to: nil)
            textFieldRect = textFieldWindow.convertToScreen(textFieldRect)
            textFieldRect.origin.y -= 5
            window.setFrameTopLeftPoint(textFieldRect.origin)
            
            var frame = window.frame
            frame.size.width = textField.frame.width
            window.setFrame(frame, display: false)
            textFieldWindow.addChildWindow(window, ordered: .above)
            
            tableView.reloadData()
        }
    }
    
    func moveUp() {
        let selectedRow = max(tableView.selectedRow - 1, 0)
        tableView.selectRowIndexes(IndexSet(integer: selectedRow), byExtendingSelection: false)
    }
    
    func moveDown() {
        let selectedRow = min(tableView.selectedRow + 1, suggestions.count - 1)
        tableView.selectRowIndexes(IndexSet(integer: selectedRow), byExtendingSelection: false)
    }
    
    var currentSuggestion: String? {
        let selectedRow = tableView.selectedRow
        return selectedRow == -1 ? nil : suggestions[selectedRow]
    }
}

extension SuggestionsWindowController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return suggestions.count
    }
}

extension SuggestionsWindowController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let view = tableView.makeView(withIdentifier: TableCellView.identifier, owner: self) as? TableCellView else { return nil }
        view.textField?.stringValue = suggestions[row]
        return view
    }
}
