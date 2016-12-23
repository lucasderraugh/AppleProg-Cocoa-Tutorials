//
//  AppDelegate.h
//  Lesson 59
//
//  Created by Lucas Derraugh on 8/17/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;
@property (weak) IBOutlet NSArrayController *arrayController;

@property (nonatomic) NSMutableArray *tableContents;

@end
