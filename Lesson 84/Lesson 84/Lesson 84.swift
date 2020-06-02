//
//  Lesson 84.swift
//  Lesson 84
//
//  Created by Lucas Derraugh on 6/1/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa
import PreferencePanes

class Lesson_84: NSPreferencePane {
    
    override func mainViewDidLoad() {
        super.mainViewDidLoad()
        // Your code here
    }
    
    @IBAction func changeTextFile(_ sender: Any) {
        FileManager.default.createFile(atPath: NSString("~/Desktop/PreferencePaneFolder/Awesome.txt").expandingTildeInPath,
                                       contents: "My Awesome File".data(using: .utf8),
                                       attributes: nil)
    }
    
    override var shouldUnselect: NSPreferencePaneUnselectReply {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.reply(toShouldUnselect: true)
        }
        return .unselectLater
    }
}
