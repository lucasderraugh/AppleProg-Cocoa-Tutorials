//
//  DropView.h
//  Lesson 24-26
//
//  Created by Lucas Derraugh on 3/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DropView : NSView <NSDraggingDestination> {
    NSImage *image;
}

@property (retain) NSImage *image;

@end
