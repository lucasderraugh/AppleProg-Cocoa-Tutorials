//
//  SecondViewController.swift
//  Lesson 81
//
//  Created by Lucas Derraugh on 4/3/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class SecondViewController: NSViewController {

    override init(nibName nibNameOrNil: NSNib.Name?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Second"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
