//
//  ViewController.swift
//  Lesson 95
//
//  Created by Lucas Derraugh on 4/8/22.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    // MARK: - NSTableViewDataSource
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        100
    }
    
    // MARK: - NSTableViewDelegate
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let tableColumn = tableColumn else {
            return nil
        }
        
        let string = "\(row)"
        
        if tableColumn.identifier == .labelColumn,
           let cell = tableView.makeView(withIdentifier: .labelIdentifier, owner: self) as? NSTableCellView
        {
            cell.textField?.stringValue = string
            return cell
        } else if tableColumn.identifier == .buttonLabelColumn,
                  let cell = tableView.makeView(withIdentifier: .buttonLabelIdentifier, owner: self) as? ButtonLabelCell {
            cell.configure(string)
            return cell
        } else {
            return nil
        }
    }
}

extension NSUserInterfaceItemIdentifier {
    static let labelColumn = NSUserInterfaceItemIdentifier("LabelColumn")
    static let labelIdentifier = NSUserInterfaceItemIdentifier("LabelIdentifier")
    
    static let buttonLabelColumn = NSUserInterfaceItemIdentifier("ButtonLabelColumn")
    static let buttonLabelIdentifier = NSUserInterfaceItemIdentifier("ButtonLabelIdentifier")
}
