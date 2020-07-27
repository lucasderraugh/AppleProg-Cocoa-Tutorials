//
//  ViewController.swift
//  Lesson 86
//
//  Created by Lucas Derraugh on 7/25/20.
//  Copyright © 2020 Lucas Derraugh. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var imageDropView: ImageDropView {
        self.view as! ImageDropView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageDropView.registerForDraggedTypes(NSFilePromiseReceiver.readableDraggedTypes.map { NSPasteboard.PasteboardType($0) })
        imageDropView.registerForDraggedTypes([.fileURL])
    }
    
    private lazy var workQueue: OperationQueue = {
        let queue = OperationQueue()
        queue.qualityOfService = .userInitiated
        return queue
    }()
    
    private lazy var destinationURL: URL = {
        let destinationURL = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Lesson86ImageFolder")
        try? FileManager.default.createDirectory(at: destinationURL, withIntermediateDirectories: true, attributes: nil)
        return destinationURL
    }()
    
    private func handleFile(at url: URL) {
        let image = NSImage(contentsOf: url)
        DispatchQueue.main.async {
            self.imageDropView.image = image
        }
    }
}

extension ViewController: ImageDropViewDelegate {
    func draggingEntered(forImageDropView imageDropView: ImageDropView, sender: NSDraggingInfo) -> NSDragOperation {
        // Add filtering here
        var isValid = false
        enumerate(draggingInfo: sender) { (draggingInfo, _, stop) in
            isValid = true
            stop.pointee = true
        }
        return isValid ? sender.draggingSourceOperationMask.intersection([.copy]) : []
    }
    
    func performDragOperation(forImageDropView imageDropView: ImageDropView, sender: NSDraggingInfo) -> Bool {
        // Perform image drop handling
        enumerate(draggingInfo: sender) { (draggingItem, _, _) in
            switch draggingItem.item {
            case let filePromiseReceiver as NSFilePromiseReceiver:
                filePromiseReceiver.receivePromisedFiles(atDestination: self.destinationURL, operationQueue: self.workQueue) { (url, error) in
                    if let error = error {
                        print("Hey we have an error: \(error)")
                    } else {
                        self.handleFile(at: url)
                    }
                }
            case let fileURL as URL:
                self.handleFile(at: fileURL)
            default:
                break
            }
        }
        
        return true
    }
    
    private func enumerate(draggingInfo: NSDraggingInfo, using block: @escaping (NSDraggingItem, Int, UnsafeMutablePointer<ObjCBool>) -> Void) {
        let supportedClasses = [
            NSFilePromiseReceiver.self,
            NSURL.self
        ]

        let searchOptions: [NSPasteboard.ReadingOptionKey: Any] = [
            .urlReadingFileURLsOnly: true,
            .urlReadingContentsConformToTypes: [ kUTTypeImage ]
        ]
        
        draggingInfo.enumerateDraggingItems(for: nil, classes: supportedClasses, searchOptions: searchOptions) { (draggingItem, index, stop) in
            block(draggingItem, index, stop)
        }
    }
}
