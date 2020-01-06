//
//  TrollWindowController.swift
//  TrollKit
//
//  Created by Lucas Derraugh on 12/12/19.
//  Copyright © 2019 Lucas Derraugh. All rights reserved.
//

import Cocoa

public class TrollWindowController: NSWindowController {
    
    @IBOutlet weak var imageView: NSImageView!
    
    public convenience init() {
        self.init(windowNibName: "TrollWindowController")
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let bundle = Bundle(identifier: "com.lucasderraugh.TrollKit")
        imageView.image = bundle?.image(forResource: "Troll")
    }
}
