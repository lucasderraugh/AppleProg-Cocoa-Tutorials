//
//  AppController.m
//  Lesson 17
//
//  Created by Lucas Derraugh on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)toolbarAction:(id)sender {
    if ([sender tag] == 0) {
        [label setStringValue:[sender label]];
    } else {
        [label setStringValue:@""];
    }
}

- (void)dealloc
{
    [super dealloc];
}

@end
