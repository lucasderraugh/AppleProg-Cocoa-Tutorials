//
//  AppController.h
//  Lesson 5
//
//  Created by Lucas Derraugh on 3/15/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppController : NSObject

@property (nonatomic, assign) IBOutlet NSTextField *label;

- (IBAction)sayHello:(id)sender;

@end
