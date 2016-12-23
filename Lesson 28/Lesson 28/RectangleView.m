//
//  RectangleView.m
//  Lesson 27
//
//  Created by Lucas Derraugh on 12/31/11.
//  Copyright (c) 2011 Lucas Derraugh. All rights reserved.
//

#import "RectangleView.h"

@implementation RectangleView {
    NSPoint startPoint;
    NSPoint endPoint;
    BOOL isOval;
}

- (instancetype)initWithFrame:(NSRect)frame {
    if (self = [super initWithFrame:frame]) {
        isOval = YES;
    }
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [NSColor.redColor set];
    NSRectFill(dirtyRect);
    
    [NSColor.blueColor set];
    if (isOval) {
        [[NSBezierPath bezierPathWithOvalInRect:NSMakeRect(startPoint.x, startPoint.y, endPoint.x-startPoint.x, endPoint.y-startPoint.y)] fill];
    } else {
        [[NSBezierPath bezierPathWithRect:NSMakeRect(startPoint.x, startPoint.y, endPoint.x-startPoint.x, endPoint.y-startPoint.y)] fill];
    }
}

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)keyDown:(NSEvent *)theEvent {
    if ([theEvent.characters isEqualToString:@"o"]) {
        isOval = !isOval;
    }
    [self setNeedsDisplay:YES];
}

- (void)mouseDown:(NSEvent *)theEvent {
    NSPoint point = [theEvent locationInWindow];
    startPoint = [self convertPoint:point fromView:nil];
}

- (void)mouseDragged:(NSEvent *)theEvent {
    NSPoint point = [theEvent locationInWindow];
    endPoint = [self convertPoint:point fromView:nil];
    [self setNeedsDisplay:YES];
}

@end
