//
//  TableCellView.swift
//  CustomSearchSuggestionsWindow
//
//  Created by Lucas Derraugh on 10/25/20.
//

import Cocoa

class TableCellView: NSTableCellView {
    static let nib = NSNib(nibNamed: String(describing: TableCellView.self), bundle: nil)
    static let identifier = NSUserInterfaceItemIdentifier(String(describing: TableCellView.self))
}
