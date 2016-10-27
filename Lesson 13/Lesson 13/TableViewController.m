//
//  TableViewController.m
//  Lesson 13
//
//  Created by Lucas Derraugh on 6/11/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "TableViewController.h"


@interface TableViewController ()

@property (nonatomic) NSMutableArray *list;

@end


@implementation TableViewController

- (id)init
{
    self = [super init];
    if (self) {
        _list = [[NSMutableArray alloc] init];
    }
    
    return self;
}

@end
