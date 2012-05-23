//
//  AppDelegate.m
//  Lesson 40
//
//  Created by Lucas Derraugh on 5/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

#define kWindowTitle @"WindowTitle"

@synthesize window = _window;
@synthesize titleTextField = _titleTextField;

+ (void)initialize {
    NSDictionary *defaults = [NSDictionary dictionaryWithObject:@"Initial Window Title" forKey:kWindowTitle];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaults];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [_window setTitle:[[NSUserDefaults standardUserDefaults] objectForKey:kWindowTitle]];
    [_titleTextField setStringValue:[[NSUserDefaults standardUserDefaults] objectForKey:kWindowTitle]];
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    [[NSUserDefaults standardUserDefaults] setObject:[_titleTextField stringValue] forKey:kWindowTitle];
}

- (IBAction)changeTitle:(id)sender {
    [_window setTitle:[_titleTextField stringValue]];
}









@end
