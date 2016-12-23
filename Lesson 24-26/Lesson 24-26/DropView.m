//
//  DropView.m
//  Lesson 24-26
//
//  Created by Lucas Derraugh on 3/4/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "DropView.h"

@implementation DropView

- (instancetype)initWithFrame:(NSRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self registerForDraggedTypes:[NSArray arrayWithObject:NSURLPboardType]];
    }
    
    return self;
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    if ([NSImage canInitWithPasteboard:[sender draggingPasteboard]] &&
        [sender draggingSourceOperationMask] & NSDragOperationCopy) {
        return NSDragOperationCopy;
    }
    return NSDragOperationNone;
}

- (BOOL)prepareForDragOperation:(id<NSDraggingInfo>)sender {
    return YES;
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    if ([NSImage canInitWithPasteboard:[sender draggingPasteboard]]) {
        NSImage *newImage = [[NSImage alloc] initWithPasteboard:[sender draggingPasteboard]];
        self.image = newImage;
        return YES;
    }
    return NO;
}

- (void)concludeDragOperation:(id<NSDraggingInfo>)sender {
    [self setNeedsDisplay:YES];
}

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    if (!self.image) {
        [NSColor.redColor set];
        NSRectFill(dirtyRect);
    } else {
        [self.image drawInRect:dirtyRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
    }
}

@end
