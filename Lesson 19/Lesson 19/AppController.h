//
//  AppController.h
//  Lesson 19
//
//  Created by Lucas Derraugh on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject {
@private
    BOOL checkBoxIsEnabled;
    int amount;
}

@property BOOL checkBoxIsEnabled;
@property int amount;

@end
