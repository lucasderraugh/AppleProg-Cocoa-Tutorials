//
//  AppDelegate.h
//  Lesson 43
//
//  Created by Lucas Derraugh on 8/3/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate, NSSharingServiceDelegate, NSSharingServicePickerDelegate>

@property (weak) IBOutlet NSWindow *window;

@end
