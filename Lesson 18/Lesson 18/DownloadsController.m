//
//  DownloadsController.m
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DownloadsController.h"


@implementation DownloadsController

@synthesize textField;

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)changeText:(id)sender {
    NSString *text = [NSString stringWithFormat:@"Num: %ld", arc4random()%10+1];
    [[self textField] setStringValue:text];
}

- (void)dealloc
{
    [super dealloc];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

@end
