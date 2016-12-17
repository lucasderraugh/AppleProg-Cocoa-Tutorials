//
//  AppController.m
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/2/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"
#import "DownloadsController.h"

@interface AppController ()

@property DownloadsController *downloadsController;

@end


@implementation AppController

- (IBAction)showDownloads:(id)sender {
    if (!_downloadsController) {
        _downloadsController = [[DownloadsController alloc] initWithWindowNibName:@"Downloads"];
    }
    [_downloadsController showWindow:self];
}

@end
