//
//  AppController.m
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "DownloadsController.h"

@implementation AppController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (IBAction)showDownloads:(id)sender {
    if (!downloadsController) {
        downloadsController = [[DownloadsController alloc] initWithWindowNibName:@"Downloads"];
    }
    [downloadsController showWindow:self];
}

- (void)dealloc
{
    [super dealloc];
}

@end
