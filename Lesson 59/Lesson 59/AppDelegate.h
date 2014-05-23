//
//  AppDelegate.h
//  Lesson 59
//
//  Created by Lucas Derraugh on 8/17/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;
@property (strong, nonatomic) NSMutableArray *tableContents;
@property (weak, nonatomic) IBOutlet NSArrayController *arrayController;

@end
