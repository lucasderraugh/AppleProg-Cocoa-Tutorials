//
//  ViewController.swift
//  Lesson 79
//
//  Created by Lucas Derraugh on 3/13/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet private weak var initialFirstResponder: NSView?
//    weak var initialWindow: NSWindow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        guard let window = initialWindow else { return }
//        window.initialFirstResponder = initialFirstResponder
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        view.window?.initialFirstResponder = initialFirstResponder
    }
}

