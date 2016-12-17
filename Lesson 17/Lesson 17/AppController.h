//
//  AppController.h
//  Lesson 17
//
//  Created by Lucas Derraugh on 7/9/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppController : NSObject

@property (weak) NSTextField *label;

- (IBAction)toolbarAction:(NSToolbarItem *)sender;

@end
