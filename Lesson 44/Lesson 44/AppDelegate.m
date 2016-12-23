//
//  AppDelegate.m
//  Lesson 44
//
//  Created by Lucas Derraugh on 11/16/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (instancetype)init {
    if (self = [super init]) {
        _people = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
    NSArray *descriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES selector:@selector(caseInsensitiveCompare:)],
                             [NSSortDescriptor sortDescriptorWithKey:@"age" ascending:YES]];
    [self.tableView setSortDescriptors:descriptors];
}

@end
