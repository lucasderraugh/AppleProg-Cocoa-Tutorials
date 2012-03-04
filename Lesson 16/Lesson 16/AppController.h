//
//  AppController.h
//  Lesson 16
//
//  Created by Lucas Derraugh on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppController : NSObject {
@private
    IBOutlet NSTextField *label;
}

- (IBAction)sayHello:(id)sender;
- (IBAction)sayGoodbye:(id)sender;

@end
