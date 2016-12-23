//
//  AppDelegate.m
//  Lesson 40
//
//  Created by Lucas Derraugh on 5/20/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

NSString *const kWindowTitle = @"WindowTitle";

@implementation AppDelegate

+ (void)initialize {
    NSDictionary *defaults = @{kWindowTitle: @"Initial Window Title"};
    [NSUserDefaults.standardUserDefaults registerDefaults:defaults];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.window.title = [NSUserDefaults.standardUserDefaults objectForKey:kWindowTitle];
    self.titleTextField.stringValue = [NSUserDefaults.standardUserDefaults objectForKey:kWindowTitle];
}

- (void)applicationWillTerminate:(NSNotification *)notification {
    [NSUserDefaults.standardUserDefaults setObject:self.titleTextField.stringValue forKey:kWindowTitle];
}

- (IBAction)changeTitle:(id)sender {
    self.window.title = self.titleTextField.stringValue;
}

@end
