//
//  AppController.m
//  Lesson 34
//
//  Created by Lucas Derraugh on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController
@synthesize sheet = _sheet;

- (IBAction)activateSheet:(id)sender {
    if (!_sheet)
        [NSBundle loadNibNamed:@"Sheet" owner:self];
    [NSApp beginSheet:self.sheet
       modalForWindow:[[NSApp delegate] window] 
        modalDelegate:self 
       didEndSelector:NULL 
          contextInfo:NULL];
}

- (IBAction)closeSheet:(id)sender {
    [NSApp endSheet:self.sheet];
    [self.sheet close];
    self.sheet = nil;
}

@end
