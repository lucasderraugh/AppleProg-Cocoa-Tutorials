//
//  AppController.h
//  Lesson 7
//
//  Created by Lucas Derraugh on 4/6/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface AppController : NSObject {
@private
    IBOutlet NSTextField *label;
    IBOutlet NSTextField *nameField;
    IBOutlet NSDatePicker *dateField;
}
- (IBAction)showMe:(id)sender;

@end
