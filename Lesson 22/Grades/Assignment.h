//
//  Assignment.h
//  Grades
//
//  Created by Lucas Derraugh on 10/2/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assignment : NSObject <NSCoding>

@property (copy) NSString *name;
@property NSInteger grade;

@end
