//
//  AppController.h
//  Lesson 34
//
//  Created by Lucas Derraugh on 3/17/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject

@property (weak) IBOutlet NSWindow *sheet;

- (IBAction)activateSheet:(id)sender;
- (IBAction)closeSheet:(id)sender;

@end
