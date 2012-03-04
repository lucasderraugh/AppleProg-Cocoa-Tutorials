//
//  Person.h
//  Lesson 13
//
//  Created by Lucas Derraugh on 6/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
@private
    NSString *name;
    int age;
}

@property (copy) NSString *name;
@property int age;

@end
