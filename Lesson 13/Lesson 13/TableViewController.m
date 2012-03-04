//
//  TableViewController.m
//  Lesson 13
//
//  Created by Lucas Derraugh on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TableViewController.h"


@implementation TableViewController

- (id)init
{
    self = [super init];
    if (self) {
        list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
