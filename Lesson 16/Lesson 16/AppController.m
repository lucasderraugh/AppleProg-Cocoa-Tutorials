//
//  AppController.m
//  Lesson 16
//
//  Created by Lucas Derraugh on 6/18/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (IBAction)sayHello:(id)sender {
    self.label.stringValue = @"Hello";
}

- (IBAction)sayGoodbye:(id)sender {
    self.label.stringValue = @"Goodbye";
}

@end
