//
//  AppDelegate.h
//  Lesson 44
//
//  Created by Lucas Derraugh on 11/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;

@property NSMutableArray *people;

@end
