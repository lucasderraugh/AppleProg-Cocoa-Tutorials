//
//  AppController.h
//  Lesson 35
//
//  Created by Lucas Derraugh on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject

@property (weak) IBOutlet NSView *ourView;
@property (strong) NSViewController *ourViewController;

- (IBAction)changeView:(id)sender;
- (void)changeViewController:(NSInteger)tag;

@end
