//
//  Lesson_39View.m
//  Lesson 39
//
//  Created by Lucas Derraugh on 5/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Lesson_39View.h"

@implementation Lesson_39View

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
        _rect = NSMakeRect(0, 0, frame.size.width/10, frame.size.height/10);
        _rectMovement = NSMakePoint(10, 10);
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    [[NSColor whiteColor] set];
    NSRectFill(_rect);
    if (_rect.origin.x > rect.size.width - _rect.size.width)
        _rectMovement.x = -_rectMovement.x;
    if (_rect.origin.x < rect.origin.x)
        _rectMovement.x = -_rectMovement.x;
    if (_rect.origin.y > rect.size.height - _rect.size.height)
        _rectMovement.y = -_rectMovement.y;
    if (_rect.origin.y < rect.origin.y)
        _rectMovement.y = -_rectMovement.y;
    _rect.origin.x += _rectMovement.x;
    _rect.origin.y += _rectMovement.y;
    [[NSColor blueColor] set];
    NSRectFill(_rect);
}

- (void)animateOneFrame
{
    [self setNeedsDisplay:YES];
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
