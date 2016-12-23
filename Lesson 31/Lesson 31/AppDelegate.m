//
//  AppDelegate.m
//  Lesson 31
//
//  Created by Lucas Derraugh on 2/13/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (NSWindow *)detachableWindowForPopover:(NSPopover *)popover {
    return _popoverWindow;
}

- (IBAction)showPopover:(id)sender {
    [_popover showRelativeToRect:[sender bounds] ofView:sender preferredEdge:NSMaxXEdge];
}
@end
