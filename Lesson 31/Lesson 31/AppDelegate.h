//
//  AppDelegate.h
//  Lesson 31
//
//  Created by Lucas Derraugh on 2/13/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSPopoverDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSPopover *popover;
@property (weak) IBOutlet NSWindow *popoverWindow;

- (IBAction)showPopover:(id)sender;

@end
