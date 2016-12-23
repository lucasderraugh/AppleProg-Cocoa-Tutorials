//
//  AppDelegate.m
//  Lesson 37
//
//  Created by Lucas Derraugh on 4/21/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (IBAction)saveSomeText:(id)sender {
    NSString *someText = @"Here is some text that is going to be saved and we will look at the error that is returned";
    NSError *error = nil;
    
    // Note: You need to change the path to something you have permission to write to, ie @"/Users/username/Desktop/myText.txt"
    BOOL result = [someText writeToFile:@"/myText.txt" atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (result == NO) {
        NSLog(@"%@", error.domain);
        NSLog(@"%ld", error.code);
        NSLog(@"%@", error.localizedDescription);
        [[NSAlert alertWithError:error] runModal];
    }
}

@end
