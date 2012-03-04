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

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        name = [[aDecoder decodeObjectForKey:@"name"] retain];
        grade = [aDecoder decodeIntForKey:@"grade"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:name forKey:@"name"];
    [aCoder encodeInt:grade forKey:@"grade"];
}

- (void)dealloc {
    [name release];
    [super dealloc];
}

@end













