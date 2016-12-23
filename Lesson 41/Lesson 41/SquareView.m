//
//  SquareView.m
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "SquareView.h"

@implementation SquareView

- (void)drawRect:(NSRect)dirtyRect
{
    [NSColor.redColor set];
    NSInteger num = [self.delegate numberOfSquaresInSquareView:self];
    for (NSInteger i = 0; i < num; i++) {
        CGFloat x = arc4random() % (NSInteger)self.frame.size.width - 20;
        CGFloat y = arc4random() % (NSInteger)self.frame.size.height - 20;
        NSRectFill(NSMakeRect(x, y, 20, 20));
    }
}

@end
