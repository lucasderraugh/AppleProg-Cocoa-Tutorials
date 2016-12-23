//
//  Person.m
//  Lesson 49
//
//  Created by Lucas Derraugh on 2/23/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init {
    return [self initWithName:@"Test Name" age:0];
}

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    if (self = [super init]) {
        _name = [name copy];
        _children = [[NSMutableArray alloc] init];
        _age = age;
    }
    return self;
}

- (void)addChild:(Person *)p {
    [self.children addObject:p];
}

@end
