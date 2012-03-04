//
//  AppController.m
//  Lesson 16
//
//  Created by Lucas Derraugh on 6/18/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (IBAction)sayHello:(id)sender {
    [label setStringValue:@"Hello"];
}

- (IBAction)sayGoodbye:(id)sender {
    [label setStringValue:@"Goodbye"];
}

@end
