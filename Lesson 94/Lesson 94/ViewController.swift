//
//  ViewController.swift
//  Lesson 94
//
//  Created by Lucas Derraugh on 3/31/22.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var invalidatingView: InvalidatingView!
    @IBOutlet weak var colorWell: NSColorWell!
    @IBOutlet weak var isBigCheckbox: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let color = NSColor.red
        invalidatingView.backgroundColor = color
        invalidatingView.isBig = false
        
        colorWell.color = color
        isBigCheckbox.state = .off
    }
    
    @IBAction func changeColor(_ sender: NSColorWell) {
        invalidatingView.backgroundColor = sender.color;
    }
    
    @IBAction func changeSize(_ sender: NSButton) {
        invalidatingView.isBig = sender.state == .on
    }
}
