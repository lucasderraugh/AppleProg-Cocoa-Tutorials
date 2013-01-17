//
//  MyView.m
//  Lesson 47
//
//  Created by Lucas Derraugh on 12/23/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (BOOL)acceptsFirstResponder {
    return YES;
}

- (void)specialAction:(id)sender {
    NSLog(@"This is in the view!");
}

@end
