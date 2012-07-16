//
//  AppController.m
//  Lesson 42
//
//  Created by Lucas Derraugh on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "Student.h"

@implementation AppController

@synthesize students = _students;

- (void)awakeFromNib {
    Student *s = [[Student alloc] init];
    s.name = @"Lucas";
    s.rating = 4;
    _students = [[NSMutableArray alloc] init];
    [arrayController addObject:s];
}

@end
