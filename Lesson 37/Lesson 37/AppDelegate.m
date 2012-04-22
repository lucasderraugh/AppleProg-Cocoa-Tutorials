//
//  AppDelegate.m
//  Lesson 37
//
//  Created by Lucas Derraugh on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;

- (IBAction)saveSomeText:(id)sender {
    NSString *someText = @"Here is some text that is going to be saved and we will look at the error that is returned";
    NSError *error = nil;
    BOOL result = [someText writeToFile:@"/myText.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result == NO) {
        NSLog(@"%@", [error domain]);
        NSLog(@"%ld", [error code]);
        NSLog(@"%@", [error localizedDescription]);
        [[NSAlert alertWithError:error] runModal];
    }
}

@end
