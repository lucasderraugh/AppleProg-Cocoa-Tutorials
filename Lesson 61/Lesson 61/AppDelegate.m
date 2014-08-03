//
//  AppDelegate.m
//  Lesson 61
//
//  Created by Lucas Derraugh on 8/2/14.
//  Copyright (c) 2014 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"
#import <ServiceManagement/ServiceManagement.h>

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (IBAction)loginItemPressed:(NSButton *)sender {
    if (!SMLoginItemSetEnabled((__bridge CFStringRef)@"com.lucasderraugh.Lesson-61-Helper", (BOOL)[sender state])) {
        NSLog(@"The login was not successful");
    }
}


@end
