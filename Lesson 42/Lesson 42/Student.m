//
//  Student.m
//  Lesson 42
//
//  Created by Lucas Derraugh on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Student.h"

@implementation Student

@synthesize name = _name;
@synthesize rating = _rating;

- (id)init {
    self = [super init];
    if (self) {
        _name = @"Nil Billy";
        _rating = 2;
    }
    return self;
}

@end
