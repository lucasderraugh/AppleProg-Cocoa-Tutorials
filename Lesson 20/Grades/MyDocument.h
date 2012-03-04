//
//  MyDocument.h
//  Grades
//
//  Created by Lucas Derraugh on 10/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument {
@private
    NSMutableArray *assignments;
}

@property (copy) NSMutableArray *assignments;

@end
