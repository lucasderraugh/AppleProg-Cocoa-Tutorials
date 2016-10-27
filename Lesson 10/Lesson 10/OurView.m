//
//  OurView.m
//  Lesson 10
//
//  Created by Lucas Derraugh on 5/6/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "OurView.h"


@implementation OurView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSRect rect = NSMakeRect(0, 0, 500, 400);
        _imageView = [[NSImageView alloc] initWithFrame:rect];
        [_imageView setImageScaling:NSScaleToFit];
        [_imageView setImage:[NSImage imageNamed:@"image.jpg"]];
        [self addSubview:_imageView];
    }
    return self;
}

@end
