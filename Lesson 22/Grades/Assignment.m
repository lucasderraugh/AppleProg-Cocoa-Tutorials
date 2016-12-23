//
//  Assignment.m
//  Grades
//
//  Created by Lucas Derraugh on 10/2/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "Assignment.h"

@implementation Assignment

- (instancetype)init {
    if (self = [super init]) {
        _name = @"Calc Quiz";
        _grade = 95;
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _name = [aDecoder decodeObjectForKey:@"name"];
        _grade = [aDecoder decodeIntegerForKey:@"grade"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.grade forKey:@"grade"];
}

@end













