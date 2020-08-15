//
//  ImageDropView.swift
//  Lesson 87
//
//  Created by Lucas Derraugh on 7/25/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

@objc protocol ImageDropViewDelegate: AnyObject {
    func draggingEntered(forImageDropView imageDropView: ImageDropView, sender: NSDraggingInfo) -> NSDragOperation
    func performDragOperation(forImageDropView imageDropView: ImageDropView, sender: NSDraggingInfo) -> Bool
    func pasteboardWriter(forImageDropView imageDropView: ImageDropView) -> NSPasteboardWriting
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
    
    override func mouseDown(with event: NSEvent) {
        if let image = image {
            window?.trackEvents(matching: [.leftMouseUp, .leftMouseDragged], timeout: NSEvent.foreverDuration, mode: .eventTracking, handler: { (event, stop) in
                guard let event = event, let delegate = delegate else { return }
                stop.pointee = true
                
                if event.type == .leftMouseDragged {
                    let draggingItem = NSDraggingItem(pasteboardWriter: delegate.pasteboardWriter(forImageDropView: self))
                    let draggingFrame = rectForDrawingImage(with: image.size)
                    draggingItem.setDraggingFrame(draggingFrame, contents: image)
                    beginDraggingSession(with: [draggingItem], event: event, source: self)
                }
            })
        } else {
            super.mouseDown(with: event)
        }
    }
    
    // MARK: - NSDraggingDestination
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        return delegate?.draggingEntered(forImageDropView: self, sender: sender) ?? []
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        return delegate?.performDragOperation(forImageDropView: self, sender: sender) ?? true
    }
    
    // Rect that matches size and position of image on screen
    // https://developer.apple.com/documentation/appkit/documents_data_and_pasteboard/supporting_drag_and_drop_through_file_promises
    
    private func rectForDrawingImage(with imageSize: CGSize) -> CGRect {
        var drawingRect = CGRect(origin: .zero, size: imageSize)
        let containerRect = bounds
        guard imageSize.width > 0 && imageSize.height > 0 else {
            return drawingRect
        }
        
        func scaledSizeToFitFrame() -> CGSize {
            var scaledSize = CGSize.zero
            let horizontalScale = containerRect.width / imageSize.width
            let verticalScale = containerRect.height / imageSize.height
            let minimumScale = min(horizontalScale, verticalScale)
            scaledSize.width = imageSize.width * minimumScale
            scaledSize.height = imageSize.height * minimumScale
            return scaledSize
        }
        
        drawingRect.size = scaledSizeToFitFrame()
        drawingRect.origin.x = containerRect.minX + (containerRect.width - drawingRect.width) * 0.5
        drawingRect.origin.y = containerRect.minY + (containerRect.height - drawingRect.height) * 0.5
        
        return drawingRect
    }
}

extension ImageDropView: NSDraggingSource {
    func draggingSession(_ session: NSDraggingSession, sourceOperationMaskFor context: NSDraggingContext) -> NSDragOperation {
        return context == .outsideApplication ? [.copy] : []
    }
}
