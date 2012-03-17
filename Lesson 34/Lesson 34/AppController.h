//
//  AppController.h
//  Lesson 34
//
//  Created by Lucas Derraugh on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject

@property (assign) IBOutlet NSWindow *sheet;

- (IBAction)activateSheet:(id)sender;
- (IBAction)closeSheet:(id)sender;

@end
