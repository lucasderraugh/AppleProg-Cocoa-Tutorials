//
//  AppDelegate.h
//  Lesson 37
//
//  Created by Lucas Derraugh on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)saveSomeText:(id)sender;

@end
