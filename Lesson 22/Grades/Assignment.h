//
//  Assignment.h
//  Grades
//
//  Created by Lucas Derraugh on 10/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Assignment : NSObject <NSCoding> {
@private
    NSString *name;
    int grade;
}

@property (copy) NSString *name;
@property int grade;

@end
