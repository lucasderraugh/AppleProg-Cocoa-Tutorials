//
//  CoolView.m
//  Lesson 48 - DB
//
//  Created by Lucas Derraugh on 1/15/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "CoolView.h"

@implementation CoolView

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)print:(id)sender {
    [[NSPrintOperation printOperationWithView:self] runOperation];
}

- (void)drawRect:(NSRect)dirtyRect {
    NSGraphicsContext *context = [NSGraphicsContext currentContext];
    if (context.isDrawingToScreen) {
        [NSColor.redColor set];
    } else {
        [NSColor.blueColor set];
    }
    NSRectFill([self bounds]);
}

@end
