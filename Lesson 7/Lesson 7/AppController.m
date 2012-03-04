//
//  AppController.m
//  Lesson 7
//
//  Created by Lucas Derraugh on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"


@implementation AppController

- (void)awakeFromNib {
    [dateField setDateValue:[NSDate date]];
}

- (IBAction)showMe:(id)sender {
    NSString *str = [NSString stringWithFormat:@"%@ was here at %@", [nameField stringValue], [dateField dateValue]];
    [label setStringValue:str];
}

@end
