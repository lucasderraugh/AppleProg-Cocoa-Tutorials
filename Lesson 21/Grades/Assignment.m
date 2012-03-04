//
//  Assignment.m
//  Grades
//
//  Created by Lucas Derraugh on 10/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Assignment.h"

@implementation Assignment

@synthesize name;
@synthesize grade;

- (id)init {
    self = [super init];
    if (self) {
        name = [[NSString alloc] initWithString:@"Calc Quiz"];
        grade = 95;
    }
    return self;
}

- (void)dealloc {
    [name release];
    [super dealloc];
}

@end
