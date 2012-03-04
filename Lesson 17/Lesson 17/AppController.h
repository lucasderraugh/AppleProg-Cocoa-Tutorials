//
//  AppController.h
//  Lesson 17
//
//  Created by Lucas Derraugh on 7/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AppController : NSObject {
@private
    IBOutlet NSTextField *label;
}

- (IBAction)toolbarAction:(id)sender;

@end
