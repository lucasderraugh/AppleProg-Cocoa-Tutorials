//
//  FirstViewController.h
//  Lesson 35
//
//  Created by Lucas Derraugh on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface FirstViewController : NSViewController

@property (weak) IBOutlet NSTextField *textField;

- (IBAction)changeText:(id)sender;

@end
