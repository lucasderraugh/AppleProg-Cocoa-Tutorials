//
//  BlueButton.m
//  Lesson 54
//
//  Created by Lucas Derraugh on 8/9/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "BlueButton.h"

@implementation BlueButton

- (BOOL)wantsUpdateLayer {
    return YES;
}

- (void)updateLayer {
    self.layer.contentsCenter = CGRectMake(0.5, 0.5, 0, 0);
    if ([self.cell isHighlighted]) {
        self.layer.contents = [NSImage imageNamed:@"button_pressed.png"];
    } else {
        self.layer.contents = [NSImage imageNamed:@"button.png"];
    }
}

@end
