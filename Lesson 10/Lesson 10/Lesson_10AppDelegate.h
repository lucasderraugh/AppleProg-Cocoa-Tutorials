//
//  Lesson_10AppDelegate.h
//  Lesson 10
//
//  Created by Lucas Derraugh on 5/4/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Lesson_10AppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *__unsafe_unretained window;
}

@property (unsafe_unretained) IBOutlet NSWindow *window;

@end
