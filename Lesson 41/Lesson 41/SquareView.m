//
//  SquareView.m
//  Lesson 41
//
//  Created by Lucas Derraugh on 6/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SquareView.h"

@implementation SquareView
@synthesize delegate;

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    [[NSColor redColor] set];
    int num = [delegate numberOfSquaresInSquareView:self];
    for (int i = 0; i < num; i++) {
        float x = arc4random() % (int)self.frame.size.width - 20;
        float y = arc4random() % (int)self.frame.size.height - 20;
        NSRectFill(NSMakeRect(x, y, 20, 20));
    }
}

@end
