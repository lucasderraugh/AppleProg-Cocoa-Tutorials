//
//  Person.m
//  Lesson 49
//
//  Created by Lucas Derraugh on 2/22/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init {
    return [self initWithName:@"Test Name" age:0];
}

- (id)initWithName:(NSString *)name age:(int)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _children = [[NSMutableArray alloc] init];
        _age = age;
    }
    return self;
}

- (void)addChild:(Person *)p {
    [_children addObject:p];
}

- (void)removeChild:(Person *)p {
    [_children removeObject:p];
}

@end
