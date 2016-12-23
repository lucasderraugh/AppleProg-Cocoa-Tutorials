//
//  DrawingView.m
//  Lesson 27
//
//  Created by Lucas Derraugh on 12/31/11.
//  Copyright (c) 2011 Lucas Derraugh. All rights reserved.
//

#import "DrawingView.h"

@implementation DrawingView {
    NSPoint startPoint;
    NSPoint endPoint;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [NSColor.redColor set];
    NSRectFill(dirtyRect);
    
    [NSColor.blueColor set];
    [[NSBezierPath bezierPathWithRect:NSMakeRect(startPoint.x, startPoint.y, endPoint.x-startPoint.x, endPoint.y-startPoint.y)] stroke];
}

- (void)mouseDown:(NSEvent *)theEvent {
    NSPoint point = theEvent.locationInWindow;
    startPoint = [self convertPoint:point fromView:nil];
}

- (void)mouseDragged:(NSEvent *)theEvent {
    NSPoint point = theEvent.locationInWindow;
    endPoint = [self convertPoint:point fromView:nil];
    [self setNeedsDisplay:YES];
}

@end








