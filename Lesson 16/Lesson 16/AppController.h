//
//  AppController.h
//  Lesson 16
//
//  Created by Lucas Derraugh on 6/18/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppController : NSObject

@property (nonatomic, weak) NSTextField *label;

- (IBAction)sayHello:(id)sender;
- (IBAction)sayGoodbye:(id)sender;

@end
