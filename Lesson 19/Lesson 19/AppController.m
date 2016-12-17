//
//  AppController.m
//  Lesson 19
//
//  Created by Lucas Derraugh on 8/30/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (instancetype)init {
    if (self = [super init]) {
        _checkBoxIsEnabled = NO;
        _amount = 20;
    }
    return self;
}

@end
