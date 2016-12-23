//
//  Student.m
//  Lesson 42
//
//  Created by Lucas Derraugh on 6/24/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "Student.h"

@implementation Student

- (instancetype)init {
    if (self = [super init]) {
        _name = @"Nil Billy";
        _rating = 2;
    }
    return self;
}

@end
