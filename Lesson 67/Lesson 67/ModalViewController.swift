//
//  ModalViewController.swift
//  Lesson 67
//
//  Created by Lucas Derraugh on 5/29/16.
//  Copyright © 2016 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ModalViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.yellow.cgColor
        view.layer?.cornerRadius = 5
    }
    
    @IBAction func dismissVC(_ sender: NSButton) {
        dismissViewController(self)
    }
}
