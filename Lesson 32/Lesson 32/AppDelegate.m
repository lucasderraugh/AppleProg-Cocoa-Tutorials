//
//  AppDelegate.m
//  Lesson 32
//
//  Created by Lucas Derraugh on 2/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate {
    NSStatusItem *statusItem;
    IBOutlet NSMenu *menu;
}

- (void)awakeFromNib {
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    statusItem.menu = menu;
    statusItem.title = @"Yoda Bar";
    statusItem.highlightMode = YES;
    statusItem.image = [NSImage imageNamed:@"image"];
}

- (IBAction)showWindow:(id)sender {
    [NSApp activateIgnoringOtherApps:YES];
    [self.window makeKeyAndOrderFront:nil];
}

- (IBAction)quit:(id)sender {
    [NSApp terminate:nil];
}


@end
