//
//  QuickLookTableView.m
//  Lesson 60
//
//  Created by Lucas Derraugh on 7/24/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

#import "QuickLookTableView.h"

@implementation QuickLookTableView

- (void)keyDown:(NSEvent *)theEvent {
    NSString *characters = [theEvent characters];
    if ([characters isEqualToString:@" "]) {
        [self.qlDelegate didPressSpacebarForTableView:self];
    } else {
        [super keyDown:theEvent];
    }
}

@end
