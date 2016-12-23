//
//  AppDelegate.h
//  Lesson 46
//
//  Created by Lucas Derraugh on 12/15/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSSplitViewDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSSplitView *splitView;

@end
