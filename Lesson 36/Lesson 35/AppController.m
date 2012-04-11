//
//  AppController.m
//  Lesson 35
//
//  Created by Lucas Derraugh on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation AppController

@synthesize ourView = _ourView;
@synthesize ourViewController = _ourViewController;

enum {
    kFirstViewTag = 0,
    kSecondViewTag
};

NSString *const kFirstView = @"FirstViewController";
NSString *const kSecondView = @"SecondViewController";

- (void)awakeFromNib {
    [self changeViewController:kFirstViewTag];
}

- (IBAction)changeView:(id)sender {
    NSInteger tag = [[sender selectedCell] tag];
    [self changeViewController:tag];
}

- (void)changeViewController:(NSInteger)tag {
    [[_ourViewController view] removeFromSuperview];
    switch (tag) {
        case kFirstViewTag:
            self.ourViewController = [[FirstViewController alloc] initWithNibName:kFirstView bundle:nil];
            break;
        case kSecondViewTag:
            self.ourViewController = [[SecondViewController alloc] initWithNibName:kSecondView bundle:nil];
            break;
    }
    [_ourView addSubview:[_ourViewController view]];
    [[_ourViewController view] setFrame:[_ourView bounds]];
    [[_ourViewController view] setAutoresizingMask:NSViewWidthSizable|NSViewHeightSizable];
}










@end
