//
//  AppController.m
//  Lesson 19
//
//  Created by Lucas Derraugh on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

@synthesize checkBoxIsEnabled;
@synthesize amount;

- (id)init
{
    self = [super init];
    if (self) {
        checkBoxIsEnabled = NO;
        amount = 20;
    }
    return self;
}

@end
