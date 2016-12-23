//
//  AppController.h
//  Lesson 35
//
//  Created by Lucas Derraugh on 4/2/12.
//  Copyright (c) 2012 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject

@property (weak) IBOutlet NSView *ourView;
@property NSViewController *ourViewController;

- (IBAction)changeView:(NSPopUpButton *)sender;
- (void)changeViewController:(NSInteger)tag;

@end
