//
//  AppController.m
//  Lesson 17
//
//  Created by Lucas Derraugh on 7/9/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (IBAction)toolbarAction:(NSToolbarItem *)sender {
    if (sender.tag == 0) {
        self.label.stringValue = sender.label;
    } else {
        self.label.stringValue = @"";
    }
}

@end
