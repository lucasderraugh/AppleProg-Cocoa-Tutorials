//
//  DownloadsController.h
//  Lesson 18
//
//  Created by Lucas Derraugh on 8/3/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface DownloadsController : NSWindowController

// Added some other things to the example
@property (assign) IBOutlet NSTextField *textField;

- (IBAction)changeText:(id)sender;

@end
