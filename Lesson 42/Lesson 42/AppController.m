//
//  AppController.m
//  Lesson 42
//
//  Created by Lucas Derraugh on 6/24/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"
#import "Student.h"

@implementation AppController

- (void)awakeFromNib {
    Student *s = [[Student alloc] init];
    s.name = @"Lucas";
    s.rating = 4;
    self.students = [[NSMutableArray alloc] init];
    [self.arrayController addObject:s];
}

@end
