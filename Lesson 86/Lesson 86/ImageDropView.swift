//
//  ImageDropView.swift
//  Lesson 86
//
//  Created by Lucas Derraugh on 7/25/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@objc protocol ImageDropViewDelegate: AnyObject {
    func draggingEntered(forImageDropView imageDropView: ImageDropView, sender: NSDraggingInfo) -> NSDragOperation
    func performDragOperation(forImageDropView imageDropView: ImageDropView, sender: NSDraggingInfo) -> Bool
}

class ImageDropView: NSView {
    
    @IBOutlet private weak var imageView: NSImageView!
    @IBOutlet weak var delegate: ImageDropViewDelegate?
    
    var image: NSImage? {
        get {
            return imageView.image
        }
        set {
            imageView.image = newValue
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.unregisterDraggedTypes()
    }
    
    // MARK: - NSDraggingDestination
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return delegate?.draggingEntered(forImageDropView: self, sender: sender) ?? []
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return delegate?.performDragOperation(forImageDropView: self, sender: sender) ?? true
    }
}
