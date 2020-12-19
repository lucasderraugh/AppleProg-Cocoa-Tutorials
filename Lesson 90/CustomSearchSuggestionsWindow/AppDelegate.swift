//
//  AppDelegate.swift
//  CustomSearchSuggestionsWindow
//
//  Created by Lucas Derraugh on 10/25/20.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    lazy var mainWindowController = MainWindowController()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        mainWindowController.showWindow(nil)
    }
}

