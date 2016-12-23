//
//  AppController.m
//  Lesson 36
//
//  Created by Lucas Derraugh on 4/2/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import "AppController.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

@implementation AppController

typedef NS_ENUM(NSInteger, ViewTag) {
    ViewTagFirst,
    ViewTagSecond
};

NSString *const kFirstView = @"FirstViewController";
NSString *const kSecondView = @"SecondViewController";

- (void)awakeFromNib {
    [self changeViewController:ViewTagFirst];
}

- (IBAction)changeView:(NSPopUpButton *)sender {
    [self changeViewController:sender.selectedCell.tag];
}

- (void)changeViewController:(NSInteger)tag {
    [_ourViewController.view removeFromSuperview];
    switch (tag) {
        case ViewTagFirst:
            self.ourViewController = [[FirstViewController alloc] initWithNibName:kFirstView bundle:nil];
            break;
        case ViewTagSecond:
            self.ourViewController = [[SecondViewController alloc] initWithNibName:kSecondView bundle:nil];
            break;
    }
    [self.ourView addSubview:self.ourViewController.view];
    self.ourViewController.view.frame = self.ourView.bounds;
    self.ourViewController.view.autoresizingMask = NSViewWidthSizable|NSViewHeightSizable;
}










@end
