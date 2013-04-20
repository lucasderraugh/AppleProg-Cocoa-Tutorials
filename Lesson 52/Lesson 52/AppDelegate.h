//
//  AppDelegate.h
//  Lesson 52
//
//  Created by Lucas Derraugh on 4/6/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSTableViewDataSource, NSTableViewDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTableView *tableView;

- (IBAction)insertNewRow:(id)sender;
- (IBAction)removeSelectedRows:(id)sender;
- (IBAction)locateInFinder:(id)sender;

@end
