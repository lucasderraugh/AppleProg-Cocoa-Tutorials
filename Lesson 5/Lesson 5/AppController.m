//
//  AppController.m
//  Lesson 5
//
//  Created by Lucas Derraugh on 3/15/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (void)awakeFromNib {
    self.label.font = [NSFont fontWithName:@"Herculanum" size:15];
    self.label.textColor = NSColor.redColor;
    self.label.backgroundColor = NSColor.blueColor;
    self.label.drawsBackground = YES;
    self.label.selectable = YES;
}

- (IBAction)sayHello:(id)sender {
    self.label.stringValue = @"Hello Youtube!!!";
}

@end
