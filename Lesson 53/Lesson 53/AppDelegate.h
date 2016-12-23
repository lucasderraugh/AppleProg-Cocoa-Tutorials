//
//  AppDelegate.h
//  Lesson 53
//
//  Created by Lucas Derraugh on 4/26/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;

@end
