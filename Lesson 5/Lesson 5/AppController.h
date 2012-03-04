//
//  AppController.h
//  Lesson 5
//
//  Created by Lucas Derraugh on 3/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppController : NSObject {
@private
    IBOutlet NSTextField *label;
}

- (IBAction)sayHello:(id)sender;

@end
