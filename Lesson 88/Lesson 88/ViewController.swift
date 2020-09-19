//
//  ViewController.swift
//  Lesson 88
//
//  Created by Lucas Derraugh on 9/17/20.
//

import Cocoa
import LocalAuthentication

class ViewController: NSViewController {
    
    @IBOutlet weak var loginButton: NSButton!
    @IBOutlet weak var imageView: NSImageView!
    
    var context = LAContext()
    
    var isLoggedIn = false {
        didSet {
            if isLoggedIn {
                loginButton.title = "Log Out"
                imageView.image = NSImage(data: NSDataAsset(name: "doge")!.data)
            } else {
                loginButton.title = "Log In"
                imageView.image = nil
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        isLoggedIn = false
    }

    @IBAction func logIn(_ sender: Any) {
        if isLoggedIn {
            isLoggedIn = false
        } else {
            context = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
                
                context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "access doge") { (success, error) in
                    if success {
                        DispatchQueue.main.async { [weak self] in
                            self?.isLoggedIn = true
                        }
                    } else {
                        print(error?.localizedDescription ?? "Failed authentication")
                    }
                }
            }
        }
    }
}
