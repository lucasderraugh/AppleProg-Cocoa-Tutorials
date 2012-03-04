//
//  AppDelegate.h
//  Lesson 31
//
//  Created by Lucas Derraugh on 2/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSPopoverDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSPopover *popover;
@property (unsafe_unretained) IBOutlet NSWindow *popoverWindow;

- (IBAction)showPopover:(id)sender;
@end
