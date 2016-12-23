//
//  Person.m
//  Lesson 44
//
//  Created by Lucas Derraugh on 11/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
    if (self = [super init]) {
        _name = @"Bob";
        _age = 40;
    }
    return self;
}

@end
