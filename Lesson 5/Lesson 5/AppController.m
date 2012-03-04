//
//  AppController.m
//  Lesson 5
//
//  Created by Lucas Derraugh on 3/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (void)awakeFromNib {
    [label setFont:[NSFont fontWithName:@"Herculanum" size:15]];
    [label setTextColor:[NSColor redColor]];
    [label setBackgroundColor:[NSColor blueColor]];
    [label setDrawsBackground:YES];
    [label setSelectable:YES];
}

- (IBAction)sayHello:(id)sender {
    [label setStringValue:@"Hello Youtube!!!"];
}

@end
