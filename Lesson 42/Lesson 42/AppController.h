//
//  AppController.h
//  Lesson 42
//
//  Created by Lucas Derraugh on 6/24/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject {
    IBOutlet NSArrayController *arrayController;
}

@property (strong) NSMutableArray *students;

@end
