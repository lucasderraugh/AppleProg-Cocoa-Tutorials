//
//  WindowController.swift
//  Lesson 81
//
//  Created by Lucas Derraugh on 4/24/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {
    
    lazy var tabViewController: NSTabViewController = {
        let tabVC = TabViewController()
        let tabItem1 = NSTabViewItem(viewController: FirstViewController())
        tabItem1.label = "First Item"
        tabItem1.image = NSImage(named: NSImage.cautionName)
        tabVC.addTabViewItem(tabItem1)
        tabVC.addTabViewItem(NSTabViewItem(viewController: SecondViewController()))
        
        tabVC.tabStyle = .unspecified
        
        return tabVC
    }()
    
    convenience init() {
        self.init(windowNibName: "WindowController")
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        contentViewController = tabViewController
    }
    
    @IBAction func firstPressed(_ sender: Any) {
        tabViewController.selectedTabViewItemIndex = 0
    }
    
    @IBAction func secondPressed(_ sender: Any) {
        tabViewController.selectedTabViewItemIndex = 1
    }
}
