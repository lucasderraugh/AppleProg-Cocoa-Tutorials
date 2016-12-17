//
//  DownloadsController.h
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/3/11.
//  Copyright 2011 Lucas Derraugh. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DownloadsController : NSWindowController

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)changeText:(id)sender;

@end
