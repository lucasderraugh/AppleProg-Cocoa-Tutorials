//
//  AppDelegate.m
//  Lesson 46
//
//  Created by Lucas Derraugh on 12/15/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSTextView *leftTextView = [[self.splitView subviews][0] documentView];
    leftTextView.string = @"This is programmatic text";
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMinCoordinate:(CGFloat)proposedMinimumPosition ofSubviewAt:(NSInteger)dividerIndex {
    return proposedMinimumPosition + 100;
}

- (CGFloat)splitView:(NSSplitView *)splitView constrainMaxCoordinate:(CGFloat)proposedMaximumPosition ofSubviewAt:(NSInteger)dividerIndex {
    return proposedMaximumPosition - 100;
}

- (BOOL)splitView:(NSSplitView *)splitView canCollapseSubview:(NSView *)subview {
    NSView *left = [splitView subviews][0];
    NSView *right = [splitView subviews][2];
    
    if ([subview isEqual:left] || [subview isEqual:right]) {
        return YES;
    }
    return NO;
}

- (BOOL)splitView:(NSSplitView *)splitView shouldCollapseSubview:(NSView *)subview forDoubleClickOnDividerAtIndex:(NSInteger)dividerIndex {
    return YES;
}











@end
