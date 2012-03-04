//
//  Person.m
//  Lesson 13
//
//  Created by Lucas Derraugh on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name;
@synthesize age;

- (id)init
{
    self = [super init];
    if (self) {
        name = @"Yoda";
        age = 300;
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
