//
//  Person.m
//  Lesson 13
//
//  Created by Lucas Derraugh on 6/11/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "Person.h"


@implementation Person

- (id)init
{
    self = [super init];
    if (self) {
        _name = @"Yoda";
        _age = 300;
    }
    
    return self;
}

@end
