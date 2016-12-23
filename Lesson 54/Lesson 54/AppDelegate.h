//
//  AppDelegate.h
//  Lesson 54
//
//  Created by Lucas Derraugh on 8/9/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//


// CHANGES FROM ORIGINAL TUTORIAL:
//
// As of 10.10 and above, you can simply add image assets to the xcassets folder
// and slice up images. Then set the images on the 'image' and 'alternate image'
// attributes of NSButton and they'll work as expected.
//
// Make sure your button type is "Momentary Change" and 'Bordered' is disabled

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (weak) IBOutlet NSWindow *window;

@end
