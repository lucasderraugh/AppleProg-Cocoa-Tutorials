//
//  AppController.h
//  Lesson 7
//
//  Created by Lucas Derraugh on 4/6/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppController : NSObject

@property (nonatomic, weak) IBOutlet NSTextField *label;
@property (nonatomic, weak) IBOutlet NSTextField *nameField;
@property (nonatomic, weak) IBOutlet NSDatePicker *dateField;

- (IBAction)showMe:(id)sender;

@end
