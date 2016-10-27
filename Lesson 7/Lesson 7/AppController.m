//
//  AppController.m
//  Lesson 7
//
//  Created by Lucas Derraugh on 4/6/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (void)awakeFromNib {
    self.dateField.dateValue = [NSDate date];
}

- (IBAction)showMe:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%@ was here at %@", self.nameField.stringValue, self.dateField.dateValue];
    self.label.stringValue = str;
}

@end
