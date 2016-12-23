//
//  Person.h
//  Lesson 49
//
//  Created by Lucas Derraugh on 2/22/13.
//  Copyright (c) 2013 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (copy) NSString *name;
@property NSInteger age;
@property (readonly, copy) NSMutableArray *children;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
- (void)addChild:(Person *)p;
- (void)removeChild:(Person *)p;

@end
