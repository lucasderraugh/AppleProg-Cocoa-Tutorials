//
//  AppDelegate.h
//  Lesson 32
//
//  Created by Lucas Derraugh on 2/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSStatusItem *statusItem;
    IBOutlet NSMenu *menu;
}

@property (assign) IBOutlet NSWindow *window;

@end