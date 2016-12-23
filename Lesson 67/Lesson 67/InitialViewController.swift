//
//  InitialViewController.swift
//  Lesson 67
//
//  Created by Lucas Derraugh on 5/29/16.
//  Copyright © 2016 Lucas Derraugh. All rights reserved.
//

import Cocoa

class InitialViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer?.backgroundColor = NSColor.red.cgColor
    }
    
    @IBAction func presentModalVC(_ sender: NSButton) {
        let modalVC = ModalViewController()
        presentViewController(modalVC, animator: ModalAnimator())
    }
}
