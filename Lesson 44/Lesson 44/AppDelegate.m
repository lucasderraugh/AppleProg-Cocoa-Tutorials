//
//  AppDelegate.m
//  Lesson 44
//
//  Created by Lucas Derraugh on 11/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (id)init {
    self = [super init];
    if (self) {
        _people = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    [_tableView setSortDescriptors:
     @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)],
    [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES]]];
}

@end
