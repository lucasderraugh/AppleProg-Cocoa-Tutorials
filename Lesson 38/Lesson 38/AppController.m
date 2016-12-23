//
//  AppController.m
//  Lesson 38
//
//  Created by Lucas Derraugh on 4/29/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (IBAction)activateAlert:(id)sender {
    NSInteger num = 6;
    [[NSAlert alertWithMessageText:NSLocalizedString(@"Message", @"This is a message")
                    defaultButton:NSLocalizedString(@"Yes", @"Yes") 
                  alternateButton:NSLocalizedString(@"No", @"No") 
                      otherButton:nil 
        informativeTextWithFormat:NSLocalizedString(@"Info Text", @"We are adding %d files to this folder"), num] runModal];
}

@end
